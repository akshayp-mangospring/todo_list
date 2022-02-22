const TodoList = () => {
  const init = () => {
    document.addEventListener('DOMContentLoaded', () => {
      const starListIcon = document.getElementsByClassName('star-todo-list');

      Array.from(starListIcon).forEach((elem) => {
        elem.addEventListener('click', (e) => {
          fetch(e.currentTarget.getAttribute('data-href'), {
            method: 'PATCH'
          })
            .then(res => res.json())
            .then(_ => {
              location.reload();
            });
        });
      });
    });
  };

  return {
    init,
  };
};

export default TodoList;
