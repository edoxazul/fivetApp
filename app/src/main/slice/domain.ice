/*
 * Copyright [2020] [Eduardo Alvarez S]
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// https://doc.zeroc.com/ice/3.7/language-mappings/java-mapping/client-side-slice-to-java-mapping/customizing-the-java-mapping
["java:package:cl.ucn.disc.pdis.fivetapp.zeroice"]
module model {

    /**
    *
    * Clase Persona
    */

    class Persona{
        /**
        * PK
        */
        int uid;

        /**
        * Rut: 55659656
        */
        string rut;

        /**
        *  Nombre
        */
        string nombre;

        /**
        *
        */
        string apellido;

        /**
        *  Direccion
        */
        string direccion;

        /**
        * Telefono Fijo: +56 55 2355000
        */
        long telefonoFijo;

        /**
        * Telefono Movil:
        */
        long telefonoMovil;

        /**
        * Correo electronico
        */
        string email;
    }

    /**
     * The Sexo
     */
    enum Sexo {
        MACHO,
        HEMBRA
    }

    /**
    * The Tipo de Paciente
    */
    enum TipoPaciente {
        INTERNO,
        EXTERNO
    }

    /**
    * The Ficha
    */

    class Ficha{
        /**
        * PK
        */
        int uid;

        /**
        * Numero: 1553
        */
        int numero;

        /**
        * Nombre : Calvin
        */
        string nombre;

        /**
        * Foto : url
        */
        string foto;

        /**
        * Especie : Canino
        */
        string especie;

        /**
        * Fecha de nacimiento
        * Format: ISO_ZONED_DATE_TIME
        */
        string fechaNacimiento;

        /**
        * Raza : rottweiler
        */
        string raza;

        /**
        * Sexo : macho / hembra
        */
        Sexo sexo;

        /**
        * Color :rojo cobrizo
        */
        string color;

        /**
        * Tipo : interno
        */
        TipoPaciente tipoPaciente;

    }

    /**
    * The control
    */

    class Control {

        /**
        * PK
        */
        int uid;

        // /**
        // * Numero de Ficha
        // */
        // int numeroFicha;

        /**
        * Fecha del control
        * Format: ISO_ZONED_DATE_TIME
        */
        string fechaControl;

        /**
        * Fecha Proximo Control , si aplica
        * Format: ISO_ZONED_DATE_TIME
        */
        string fechaProximoControl;

        /**
        * Temperatura en C°
        */
        double temperatura;

        /**
        * Peso en kg
        */
        double peso;

        /**
        * Altura en cm
        */
        double altura;

        /**
        * Diagnostico
        */
        string diagnostico;

        /**
        * Veterinario , nombre del veterinario que realizó el control
        */
        string nombreVeterinario;
    }

    /**
    * The Examen
    */

    class Examen{

        /**
        * PK
        */
        int uid;

        /**
        * Nombre del examen: Radiología
        */
        string nombreExamen;

        /**
        * Fecha en que fue tomado el examen : 15/07/2019
        * Format: ISO_ZONED_DATE_TIME
        */
        string fechaExamen;
    }

    /**
    * The Contratos.
    */

    interface Contratos {

        /**
        * Deseo registrar los datos de un paciente.
        *
        * @param ficha a crear en el backend.
        * @return the ficha almacenada en el backend (con numero asignado).
        */
        Ficha crearFicha(Ficha ficha);

        /**
        * Deseo registrar los datos del duenio de un paciente.
        *
        * @param persona a crear en el backend.
        * @return the Persona almacenada en el backend.
        */
        Persona crearPersona(Persona persona);

        /**
        * Deseo registrar los datos de un Control.
        *
        * @param numeroFicha al cual sera asignado el control.
        * @param control a agregar.
        */
        Control crearControl(int numeroFicha, Control control);

        /**
        * Dado un numero de ficha, retorna la ficha asociada.
        *
        * @param numero de la ficha a obtener.
        * @return the Ficha.
        */
        Ficha obtenerFicha(int numero);

        /**
        * Dado un numero de rut obtiene la persona.
        *
        * @param rut de la persona a buscar.
        * @return the Persona.
        */
        Persona obtenerPersona(string rut);

    }

    /**
    * The base system.
    */
    interface TheSystem {

        /**
        * @return the diference in time between client and server.
        */
        long getDelay(long clientTime);
    }

}
