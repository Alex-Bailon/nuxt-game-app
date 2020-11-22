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
          url: 'https://www.clipartmax.com/png/middle/244-2448974_file-hands-zip-fist-hand-white-png.png'
        }, 
        {
          name: 'Paper',
          url: 'https://www.pinclipart.com/picdir/middle/201-2018373_vector-hand-png-clipart.png'
        },
        {
          name: 'Scissors',
          url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuoasNTbqEj8OFOPTt6DGetncBCBMlO79G0Q&usqp=CAU'
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
      <v-row>
        <v-col v-for="choice in possibleChoices" :key="choice.name" cols="12" sm="4">
          <v-card @click="choiceMade(choice)" >
            <v-img height="250" :src="choice.url"/>
            <v-card-title >
              {{ choice.name }}
            </v-card-title>
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
