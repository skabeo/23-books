// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener('DOMContentLoaded', function () {
  const hamburger = document.querySelector('.hamburger');
  const menuContainer = document.querySelector('.menu-container');
  const closeButton = document.querySelector('.close-button');

  hamburger.addEventListener('click', function () {
    menuContainer.style.display = 'block';
  });

  closeButton.addEventListener('click', function () {
    menuContainer.style.display = 'none';
  });
});

