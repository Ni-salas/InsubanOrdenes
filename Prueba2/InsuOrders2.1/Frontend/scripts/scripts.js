// Página Principal:
document.addEventListener('DOMContentLoaded', function () {
    const menuItems = document.querySelectorAll('.menu-item');

    // Ocultamos todos los submenús al cargar la página
    document.querySelectorAll('.sub-menu').forEach(subMenu => {
        subMenu.style.display = 'none';
    });

    menuItems.forEach(item => {
        item.addEventListener('click', function (e) {
            e.preventDefault();

            // Cerramos otros submenús si están abiertos
            const siblingMenus = this.parentElement.parentElement.querySelectorAll('.sub-menu');
            siblingMenus.forEach(menu => {
                if (menu !== this.nextElementSibling) {
                    menu.style.display = 'none';
                }
            });

            const subMenu = this.nextElementSibling;
            if (subMenu && subMenu.classList.contains('sub-menu')) {
                // Alternamos la visibilidad del submenú
                subMenu.style.display = subMenu.style.display === 'block' ? 'none' : 'block';
            }
        });
    });

    // Cerrar los submenús si se hace clic fuera de la barra de navegación
    document.addEventListener('click', function (e) {
        if (!e.target.closest('.navbar')) {
            document.querySelectorAll('.sub-menu').forEach(menu => {
                menu.style.display = 'none';
            });
        }
    });
});