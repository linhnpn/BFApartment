var btnOpen = document.querySelector('.open-modal-btn')
var modal = document.querySelector('.modal')
var btnClose = document.querySelector('.modal__footer button')
var iconClose = document.querySelector('.modal__header i')

function toggleModal(e) {
    modal.classList.toggle('hide')
}
btnOpen.addEventListener('click', toggleModal)
btnClose.addEventListener('click', toggleModal)
iconClose.addEventListener('click', toggleModal)
modal.addEventListener('click', function(e) {
    if (e.target == e.currentTarget) {
        toggleModal()
    }
})
jQuery(document).ready(function($) {
    //hide or show password
    $('.hide-password').on('click', function() {
        var $this = $(this),
                $password_field = $this.prev('input');
        ('password' == $password_field.attr('type')) ? $password_field.attr('type', 'text') : $password_field.attr('type', 'password');
        ('Hide' == $this.text()) ? $this.text('Show') : $this.text('Hide');
        //focus and move cursor to the end of input field
        $password_field.putCursorAtEnd();
    }
    );
}
);
