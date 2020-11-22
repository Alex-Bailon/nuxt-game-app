<script>
export default {
  data () {
    return {
      startTimer: false,
      timeStated: null,
      timeEnded: null,
      time: null
    }
  },
  mounted(){
    setTimeout(() => {
      this.startTimer = true
      this.timeStated = new Date()
    }, Math.floor(Math.random() * 9000) + 1000)
  },
  methods: {
    stopTimer(){
      this.timeEnded = new Date()
      this.time = this.timeEnded - this.timeStated
    },
    playAgain(){ 
      this.startTimer = false
      setTimeout(() => {
        this.startTimer = true
        this.timeStated = new Date()
      }, Math.floor(Math.random() * 9000) + 1000)
    }
  }
}
</script>

<template>
  <v-container fluid>
    <v-row justify="center">
      <h2>Click on the box when it turns green to check your reaction time!</h2>
    </v-row>
    <v-row class="py-2" justify="center">
      <div @click="stopTimer" :class="startTimer ? 'green' : 'red' " id="box"></div>
    </v-row>
    <v-row v-if="time" justify="center">
      <h2> Your reaction time was {{ time }} milliseconds </h2>
    </v-row>
    <v-row v-if="time" justify="center">
      <v-btn @click="playAgain" color="primary">Play Again</v-btn>
    </v-row>
  </v-container>
</template>

<style scooped>
  #box {
    height: 300px;
    width: 300px;
  }
  .red {
    background-color: red;
  }
  .green {
    background-color: green;
  }
</style>