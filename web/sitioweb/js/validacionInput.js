   function validarCampos() {
       
       $(document).ready(function () {
                jQuery.validator.addMethod("lettersonly", function (value, element) {
                    return this.optional(element) || /^[a-zA-ZÃ¡Ã©Ã­Ã³ÃºÃ Ã¨Ã¬Ã²Ã¹ÃÃÃÃÃÃÃÃÃÃÃ±ÃÃ¼Ã_\s]+$/i.test(value);
                }, '<div class="alert alert-info  movera"  role="alert">solo puede ingresar letras</div>');

                // sirver para validar los campos del formulario
                $("#form1").validate({
                        rules: {
                              pass: {
                                  required: true,                                  
                                  minlength: 5,
                                  maxlength: 13
                              },
                              user: {
                                  required: true,
                                  minlength: 5,
                                  maxlength: 20
                              }
                        },
                        messages: {
                            pass: {
                                required: '<div class="alert alert-info movera" role="alert">Este campo es Requerido</div>',
                                minlength:  '<div class="alert alert-info movera" role="alert">Son {0} digitos Mínimo </div>',
                                maxlength:  '<div class="alert alert-info movera" role="alert">Son {0} digitos Máximo </div>'
                            },
                            user: {
                                required:  '<div class="alert alert-info movera" role="alert">Este campo es Requerido</div>',
                                number: '<div class="alert alert-info movera" role="alert">El  campo debe ser Numérico  </div>',
                                minlength: '<div class="alert alert-info movera" role="alert">Son {0} digitos Mínimo </div>',
                                maxlength:  '<div class="alert alert-info movera" role="alert">Son {0} digitos Máximo </div>'
                                
                                 
                            }
                        },
                });
         });
     }