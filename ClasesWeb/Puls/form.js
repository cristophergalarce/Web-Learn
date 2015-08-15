var $form = $("#formulario"),
	$titulo = $("#titulo"),
	$url = $("#url"),
	$publicar = $("#mostrarform"),
	$list = $("#contenido"),
	$post = $(".item").first(); //selecciona el primero

// Funciones
// programo las funciones de los eventos

function mostrarForm()
{
	$form.slideToggle(); //muestra el elemento con ease
	return false; // prevent default y stop bobbling. evita el link hacia #
}

function agregarPost()
{
	// val es funcion de jquery
	// considera el valor entre ()
	// clone es funcion de jquery
	// clona la variable declarada
	var titulo = $titulo.val(),
		url = $url.val(),
		$clon = $post.clone();

	// find es funcion de jquery
	// es encontrar el selector css
	// y su etiqueta correspondiente
	// text es funcion de jquery
	// reemplazara el anchor
	// anterior por la variable entre 
	// sus ()
	$clon.find('.titulo_item a')
	.text(titulo)
	.attr('href', url);

	// display none
	$clon.hide();

	// append coloca al ultimo lugar
	// prepend coloca al primer lugar
	$list.prepend($clon);

	// animacion de colocacion
	$clon.fadeIn();

	return false;
}

// Eventos
// Declaro eventos que tienen funciones
$publicar.click( mostrarForm ); //funcion conocida de jquery es click
$form.on( 'submit', agregarPost );