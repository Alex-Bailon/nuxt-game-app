<script>
export default {
  data () {
    return {
      userChoice: null,
      computersChoice: null,
      finalResults: '',
      possibleResults: [
        ['t', 'u', 'c'], 
        ['c', 't', 'u'], 
        ['u', 'c', 't'], 
      ],
      resultsKey: {
        't': 'Its a Tie',
        'c': 'Sorry, you Lose :(',
        'u': 'You Win!! :D'
      },
      possibleChoices:[ 
        {
          name: 'Rock',
          url: 'https://www.pinclipart.com/picdir/big/536-5360218_rock-paper-scissors-clipart-png-download-paper-rock.png'
        }, 
        {
          name: 'Paper',
          url: 'https://www.pinclipart.com/picdir/big/536-5360310_transparent-rock-paper-scissors-clipart-rock-paper-scissors.png'
        },
        {
          name: 'Scissors',
          url: 'https://www.pinclipart.com/picdir/big/536-5360227_scissors-hand-rock-paper-scissors-png-clipart.png'
        }
      ]   
    }
  },
  methods: {
    choiceMade(choice){
      const computersIndex = Math.floor(Math.random() * 3)
      const usersIndex = this.possibleChoices.indexOf(choice)
      console.log(usersIndex)
      this.finalResults = this.resultsKey[this.possibleResults[computersIndex][usersIndex]]
      this.computersChoice = this.possibleChoices[computersIndex]
      this.userChoice = choice
    },
  }
}
</script>

<template>
  <v-container fluid>
    <div v-if="userChoice == null">
      <h1>Please Select Your Choice</h1>
      <v-row justify="center">
        <v-col v-for="choice in possibleChoices" :key="choice.name" cols="12" sm="6">
          <v-card flat @click="choiceMade(choice)" >
            <v-img contain height="300" :src="choice.url"/>
          </v-card>
        </v-col>
      </v-row>
    </div> 
    <div v-else>
      <v-row align="center">
        <h1> {{ finalResults }} </h1> <v-spacer/> <v-btn @click="userChoice = null" color="primary">Play Again</v-btn>
      </v-row>
      <v-row>
        <v-col cols="12" sm="6">
          <h1>You selected</h1>
          <v-card>
            <v-img height="250" :src="userChoice.url"/>
            <v-card-title>
              {{ userChoice.name }}
            </v-card-title>
          </v-card>
        </v-col>
        <v-col cols="12" sm="6">
          <h1>Computer selected</h1>
          <v-card>
            <v-img height="250" :src="computersChoice.url"/>
            <v-card-title>
              {{ computersChoice.name }}
            </v-card-title>
          </v-card>
        </v-col>
      </v-row>
    </div>
  </v-container>
</template>
