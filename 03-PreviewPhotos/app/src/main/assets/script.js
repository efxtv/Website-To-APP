// Get elements
const sidebar = document.getElementById('sidebar');
const content = document.getElementById('content');
const menuButton = document.querySelector('.menu-button');
const closeButton = document.querySelector('.close-button');
const dialog = document.getElementById('htmlDialog');

// Sidebar Functions
function toggleSidebar(open) {
  sidebar.classList.toggle('open', open);
  content.classList.toggle('blurred', open);
  menuButton.style.display = open ? 'none' : 'block';
  closeButton.style.display = open ? 'block' : 'none';
}

menuButton.addEventListener('click', () => toggleSidebar(true));
closeButton.addEventListener('click', () => toggleSidebar(false));

// Close sidebar if clicked outside
content.addEventListener('click', (event) => {
  if (sidebar.classList.contains('open')) {
    toggleSidebar(false);
  }
});

// Dialog Functions
function showDialog() {
  toggleSidebar(false);
  if (dialog) dialog.showModal();
}

function closeDialog() {
  if (dialog) dialog.close();
}

