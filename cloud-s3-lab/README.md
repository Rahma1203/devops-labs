

Un bucket S3 es un contenedor de almacenamiento en la nube de AWS donde
puedes guardar archivos de prácticamente de cualquier tipo. En mi caso
para este laboratorio he usado LocalStack, que simula los servicios de 
AWS.

ANTES DE COMENZAR CON EL LABORATORIO DEBES TENER CONFIGURADO LOCALSTACK

Para arrancar el laboratorio tienes que seguir estos pasos:

1. Arranca el servicio
docker compose up -d localstack 

2. Comprueba que este funcionando

docker compose ps
curl .fsS http://127.0.0.1:4566/_localstack/healt

Deberías obtener una respuesta JSON

3. Crear un bucket

docker compose run --rm aws \
  --endpoint-url=http://localstack:4566 \
  s3api create-bucket \
  --bucket devops-lab-assets \
  --create-bucket-configuration LocationConstraint=eu-west-1

3.1 Comprueba que existe

docker compose run --rm aws \
 --endpoint-url=http://localstack:4566 \
 s3 ls

4. Subir el archivo 

docker compose run --rm aws \
 --endpoint-url: http://localstack:4566 \
 s3 cp site/index.html s3://devops-lab-assets/index.html \
 --content-type text-html

 4.1 Comprueba el contenido del bucket 

docker compose run --rm aws \
  --endpoint-url: http:\\localstack:4566 \
   s3 ls s3://devops:lab-assets/

4.2 Inspecciona el objecto 

docker compose run --rm aws \
  --endpoint-url: http:\\localstack:4566 \
  s3api head-object \
  --bucket devops-lab-assets \
  --key index.html

5. Descarga y verifica 

docker compose run --rm aws \
  --endpoint-url=http://localstack:4566 \
  s3 cp s3://devops-lab-assets/index.html output/index.html

Compara el archivo original con el descargado:

cmp site/index.html output/index.html
echo $?
