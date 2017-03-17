# Google Cloud con Terraform

### ¿Qué es Terraform?

### ¿En dónde está la documentación de Terraform?

### Checklist
- [ ] La cuenta de Google Cloud ha sido creada
- [ ] La Service Account para Terraform ha sido creada
- [ ] Los permisos para la Service Account de Terraform han sido asignados
      - [ ] Compute Instance Admin (v1)
      - [ ] Google Cloud Key Management Service (KMS) API
- [ ] La Service Account key ha sido creada (API Manager -> Credentials)
- [ ] La Google Cloud Resource Manager API ha sido habilitada

### Verificando la instalación

```
$ terraform
```

```
$ terraform version
```
## Conceptos clave
  - Configuration Files
  - State Files
  - Providers
  - Provisioners
  - Modules
  - Variables & Interpolation
  - Execution Plans

## ¿Cómo se organizan las cosas en Terraform?
Explicar el orden en el que Terraform carga los archivos en un directorio.
  - El orden no importa
  - Subdirectorios no se cargan.

## Ejercicio #1
Objetivo: familiarizarse con Terraform. Aprender cómo crear una configuración de Terraform,
crear un plan de ejecución y aplicarlo.

1. Crear un archivo de configuración de Terraform llamado `main.tf` en el que definamos
     - Un bloque de proveedor de Google
     - Un recurso `google_project`

2. En consola
   ```
   $ terraform plan
   ```
  Explicar qué hace el plan execution.

3.  En consola
    ```
    $ terraform apply
    ```

4. Analizar el archivo `terraform.tfstate`

5. Hacer algún cambio en la definición del `google_project` y aplicar los cambios

## Ejercicio #2
Objetivo: aprender que no importa en dónde se definan los recursos en Terraform,
Terraform hala todo lo que haya en un directorio.

1. Extraer la configuración del proveedor de Google del archivo `main.tf` a un
   archivo llamado `providers.tf`

2. En consola
   ```
   $ terraform plan
   ```

3. En consola
   ```
   $ terraform apply
   ```
4.  Renombrar el archivo `main.tf` a `projects.tf`

## Ejercicio #3
Objectivo: Crear una **Compute Instance** en Google Cloud

1. Definir la configuración del recurso `google_compute_instance` en un archivo
   llamado `compute_instances.tf`

2. En consola
   ```
   $ terraform plan
   ```

3. En consola
   ```
   $ terraform apply
   ```

## Ejercicio #4
Objetivo: Destruir recursos en Google Cloud

1. En consola

     ```
     $ terraform destroy
     ```

## Ejercicio #5
Objetivo: Crear una **Compute Instance** en Google Cloud, usando un environment name
como prefijo usando variables. E.g., el nombre de la instancia debería ser `dev-ayylmao001`.

1. Escribir la definición del recurso en el archivo `compute_instances.tf` con el nombre del environment
   quemado en el código
   ```
   resource "google_compute_instance" "web" {
      name = "dev-web001"
   }
   ```

2. En consola
   ```
   $ terraform plan
   ```

3. En consola
   ```
   $ terraform apply
   ```

4. Crear un archivo llamado `vars.tf` y definir ahí la variable `env`
   ```
   variable "env" {
      default = "dev"
      description = "some useful description"
   }
   ```

5. Interpolar la variable `env` en el nombre de la **Compute Instance** en el
   archivo `compute_instances.tf`
   ```
   resource "google_compute_instance" "web" {
      name = "${var.env}-web001" # se convierte en "dev-web001", "test-web001", etc.
   }
   ```

6. En consola
   ```
   $ terraform plan
   ```

7. En consola
   ```
   $ terraform apply
   ```

## Ejercicio #6
Objetivo: Crear múltiples instancias de **Compute Instance** en Google Cloud usando la variable
especial `count`.

1. Agregar el campo `count` a la definición del recurso `google_compute_instance`.

2. Aplicar los cambios

3. Sacar el valor del campo `count` de una variable definida en el archivo `vars.tf`

## Ejercicio #7
Objetivo: Crear recursos que tengan dependencias en otros recursos a.k.a. crear recursos
que dependenan de otros recursos. Por ejemplo: `google_project` con `google_compute_instance`.

# Resumen

# Recursos
- [Machine Types de la Google Cloud](https://cloud.google.com/compute/docs/machine-types)
- [Regiones y Zonas de la Google Cloud](https://cloud.google.com/compute/docs/regions-zones/regions-zones)
