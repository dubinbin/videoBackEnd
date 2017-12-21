export default {
  SET_USER: (state, payload)=> {
    state.user = payload;
    window.localStorage.setItem('userName',payload.name);
  },
  GET_USER:(state,payload)=>{
    state.user = payload
  },
  SET_TITLE_NAME:(state,payload)=>{
    state.titleName = payload
  }
}
