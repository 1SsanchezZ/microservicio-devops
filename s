[1mdiff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml[m
[1mindex 103fb72..7acd8a9 100644[m
[1m--- a/.github/workflows/ci.yml[m
[1m+++ b/.github/workflows/ci.yml[m
[36m@@ -5,7 +5,6 @@[m [mon:[m
     branches:[m
       - main[m
       - develop[m
[31m-[m
   pull_request:[m
     branches:[m
       - main[m
[36m@@ -65,26 +64,70 @@[m [mjobs:[m
           format: table[m
           exit-code: '1'[m
           severity: CRITICAL[m
[31m-          ignore-unfixed: 'true' [m
[31m-          [m
[31m-  deploy_simulated:[m
[31m-    name: Despliegue Automatizado (Entorno Simulado)[m
[32m+[m[32m          ignore-unfixed: 'true'[m
[32m+[m
[32m+[m[32m  deploy:[m
[32m+[m[32m    name: Despliegue Continuo en AWS EC2 Real[m
     runs-on: ubuntu-latest[m
[31m-    needs: security[m
[32m+[m[32m    needs: security # Si Trivy falla (exit-code '1'), el despliegue nunca se ejecuta (Cumple IE6)[m
[32m+[m
     steps:[m
       - name: Descargar repositorio[m
         uses: actions/checkout@v3[m
 [m
[31m-      - name: Levantar entorno con Docker Compose[m
[31m-        run: docker compose up -d --build[m
[32m+[m[32m      - name: Compilar Imagen de Producción[m
[32m+[m[32m        run: docker build -t microservicio-devops:latest .[m
 [m
[31m-      - name: Verificar disponibilidad del microservicio (Healthcheck)[m
[31m-        run: |[m
[31m-          echo "Esperando a que el contenedor inicie de forma segura..."[m
[31m-          sleep 5[m
[31m-          curl --fail http://localhost:5000/health || exit 1[m
[31m-          echo "¡Despliegue simulado exitoso! El microservicio responde correctamente."[m
[32m+[m[32m      - name: Empaquetar Imagen a Archivo Comprimido[m
[32m+[m[32m        run: docker save -o microservicio.tar microservicio-devops:latest[m
 [m
[31m-      - name: Apagar entorno simulado[m
[31m-        if: always()[m
[31m-        run: docker compose down[m
\ No newline at end of file[m
[32m+[m[32m      - name: Instalar Docker y Preparar Servidor Remoto EC2[m
[32m+[m[32m        uses: appleboy/ssh-action@v1.0.3[m
[32m+[m[32m        with:[m
[32m+[m[32m          host: ${{ secrets.EC2_HOST }}[m
[32m+[m[32m          username: ec2-user[m
[32m+[m[32m          key: ${{ secrets.EC2_SSH_KEY }}[m
[32m+[m[32m          script_stop: true[m
[32m+[m[32m          script: |[m
[32m+[m[32m            echo "--- Verificando estado de Docker en AWS ---"[m
[32m+[m[32m            if ! command -v docker &> /dev/null; then[m
[32m+[m[32m              sudo yum update -y[m
[32m+[m[32m              sudo yum install docker -y[m
[32m+[m[32m              sudo systemctl start docker[m
[32m+[m[32m              sudo systemctl enable docker[m
[32m+[m[32m              sudo usermod -aG docker ec2-user[m
[32m+[m[32m            fi[m
[32m+[m[41m            [m
[32m+[m[32m            echo "--- Limpiando contenedores antiguos para liberar el puerto 5000 ---"[m
[32m+[m[32m            docker stop mi-app-flask || true[m
[32m+[m[32m            docker rm mi-app-flask || true[m
[32m+[m
[32m+[m[32m      - name: Transferir Archivo Tar al Servidor de AWS[m
[32m+[m[32m        uses: appleboy/scp-action@v0.1.7[m
[32m+[m[32m        with:[m
[32m+[m[32m          host: ${{ secrets.EC2_HOST }}[m
[32m+[m[32m          username: ec2-user[m
[32m+[m[32m          key: ${{ secrets.EC2_SSH_KEY }}[m
[32m+[m[32m          source: "microservicio.tar"[m
[32m+[m[32m          target: "/home/ec2-user/"[m
[32m+[m
[32m+[m[32m      - name: Cargar Imagen y Levantar Contenedor en AWS[m
[32m+[m[32m        uses: appleboy/ssh-action@v1.0.3[m
[32m+[m[32m        with:[m
[32m+[m[32m          host: ${{ secrets.EC2_HOST }}[m
[32m+[m[32m          username: ec2-user[m
[32m+[m[32m          key: ${{ secrets.EC2_SSH_KEY }}[m
[32m+[m[32m          script_stop: true[m
[32m+[m[32m          script: |[m
[32m+[m[32m            echo "--- Cargando la nueva imagen Docker ---"[m
[32m+[m[32m            docker load -i /home/ec2-user/microservicio.tar[m
[32m+[m[32m            rm -f /home/ec2-user/microservicio.tar[m
[32m+[m[41m            [m
[32m+[m[32m            echo "--- Iniciando el microservicio en el puerto 5000 ---"[m
[32m+[m[32m            docker run -d -p 5000:5000 --name mi-app-flask microservicio-devops:latest[m
[32m+[m[41m            [m
[32m+[m[32m            echo "--- Validando disponibilidad del servicio ---"[m
[32m+[m[32m            sleep 5[m
[32m+[m[32m            docker ps[m
[32m+[m[32m            curl --fail http://localhost:5000/health || exit 1[m
[41m+            [m
\ No newline at end of file[m
