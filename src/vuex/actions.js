export default {
  setUsername({commit}, payload){
    commit('SET_USER', payload)
  },
  getUsername({commit},payload){
    commit('GET_USER',payload)
  },
  setTitlename({commit},payload){
    commit('SET_TITLE_NAME',payload)
  }
}
