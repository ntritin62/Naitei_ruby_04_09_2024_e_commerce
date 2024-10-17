document.addEventListener('turbo:load', () => {
  const modal = document.getElementById('modal');
  const form = modal.querySelector('form');

  document.getElementById('open-modal').addEventListener('click', () => modal.classList.remove('hidden'));
  document.getElementById('close-modal').addEventListener('click', () => modal.classList.add('hidden'));

  form.addEventListener('submit', event => {
    event.preventDefault();

    fetch(form.action, {
      method: 'POST',
      body: new FormData(form),
      headers: { 'X-Requested-With': 'XMLHttpRequest' }
    })
      .then(response => {
        if (response.ok) {
          modal.classList.add('hidden');
          location.reload();
        } else {
          return response.text().then(text => {
            const errorDiv = modal.querySelector('.error-messages');
            errorDiv.innerHTML = text;
            errorDiv.classList.remove('hidden');
          });
        }
      });
  });
});


document.addEventListener('turbo:load', () => {
  // Lắng nghe các sự kiện mở modal cho từng category
  document.querySelectorAll('.open-show-modal').forEach(button => {
    button.addEventListener('click', (event) => {
      event.preventDefault();
      const categoryId = event.currentTarget.dataset.categoryId; // Lấy ID category từ data attribute
      const showModal = document.getElementById(`show-modal-${categoryId}`); // Lấy modal tương ứng
      showModal.classList.remove('hidden'); // Mở modal
    });
  });

  document.querySelectorAll('.open-edit-modal').forEach(button => {
    button.addEventListener('click', (event) => {
      event.preventDefault();
      const category = JSON.parse(event.currentTarget.dataset.category); // Lấy thông tin category
      const editModal = document.getElementById(`edit-modal-${category.id}`); // Lấy modal tương ứng
      editModal.querySelector('input[name="category[name]"]').value = category.name; // Cập nhật tên category
      editModal.classList.remove('hidden'); // Mở modal
    });
  });

  document.getElementById('close-show-modal').addEventListener('click', () => {
    showModal.classList.add('hidden');
  });

  document.getElementById('close-edit-modal').addEventListener('click', () => {
    editModal.classList.add('hidden');
  });
});
