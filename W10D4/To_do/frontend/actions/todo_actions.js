export const RECEIVE_TODO = "RECEIVE_TODO";
export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const REMOVE_TODO = "REMOVE_TODO";


export const receiveTodo = (todoPayload)=>{
  // debugger
  return {
    type: RECEIVE_TODO,
    todo: todoPayload
  }
}

export const removeTodo = (todoPayload) => {
  return {
    type: REMOVE_TODO,
    todo: todoPayload
  };
};

export const receiveTodos = (todosPayload) => { //action creators
  return {
    type: RECEIVE_TODOS,
    todos: todosPayload
  }
}