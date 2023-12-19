<template>
	<body>
		<div class="main" id="main">
          <div class="title" style="color: aqua;">SERVER ABI</div>

          <div class="buttons">
            <button  @click="hand" class="button1" id="button1">MUSKLID</button>
            <button  @click="coms" class="button2" id="button2">KÄSUD</button>
            <button  @click="ruls" class="button3" id="button3">REEGLID</button>
            <button  @click="rep" class="button4" id="button4">KAEBA</button>

            
          </div>

          <div>
            <div>
              <div v-if="hands" class="info1" style="color: aliceblue;">
                <h1>MUSKLID</h1>
                <br>
                NB! Enamus musklid on serveri sisesed mida te ise ei saa muuta!
                <p><b style="background-color: rgb(44, 44, 44);">[F1]</b> - Valikute menüü</p>
                <p><b style="background-color: rgb(44, 44, 44);">[TAB]</b> - Taskud</p>
                <p><b style="background-color: rgb(44, 44, 44);">[K]</b> - Sekundaarsed taskud</p>
                <p><b style="background-color: rgb(44, 44, 44);">[E]</b> - Endiste kasutuste muskel</p>
                <p><b style="background-color: rgb(44, 44, 44);">[G]</b> - Auto käivitamine</p>
                <p><b style="background-color: rgb(44, 44, 44);">[H]</b> - Auto muukimine</p>
                <p><b style="background-color: rgb(44, 44, 44);">[L]</b> - Auto lukustamine</p>
                <p><b style="background-color: rgb(44, 44, 44);">[L]</b> - Auto lukustamine</p>
              </div>
            </div>
            <div>
              <div v-if="comms" class="info2" style="color: aliceblue;">
                <div class='content'>
                        <h1>KÄSUD</h1>
                        <br>
                        <p><b style="background-color: rgb(44, 44, 44);">/arve</b> - Saad teha arveid</p>
                        <p><b style="background-color: rgb(44, 44, 44);">/inventory</b> - Avab tasku</p>
                        <p><b style="background-color: rgb(44, 44, 44);">/kaebus</b> - Saad luua kaebuse</p>
                        <p><b style="background-color: rgb(44, 44, 44);">/abi</b> - Avab abi tahvli</p>
                        <p><b style="background-color: rgb(44, 44, 44);">/fpson</b> - Teeb muudatusi kaadrisagedusega</p>
                        <p><b style="background-color: rgb(44, 44, 44);">/fpsoff</b> - Keelustab kaadrisageduse muudatused</p>
                    </div>
                
              </div>
            </div>
            <div>
              
                <div v-if="rules" class="info3" style="color: aliceblue;">
                  <h1>REEGLID</h1>
                  <iframe class="doc" onmousedown="return false" onselectstart="return false" src="https://docs.google.com/document/d/e/2PACX-1vQ5wBX_db1NH9i5jg2PQXNXQDSTKcrIE_HCYOgLVeYH_L3rZSwLAp41hVnidea_W6X71_VUxyyL356N/pub?embedded=true" style="width:101.5%; height:465px; border:0; margin-left: -1%; border-radius:10%;"></iframe>
                </div>
              
              
            </div>
            <div>
              <div v-if="report" class="report" style="color: aliceblue;">
                KAEBUSE ESITAMINE
                <div>HETKEL ARENDAMISEL!</div>
                <div class="input"></div>
              </div>
            </div>
            
            
      
          </div>
        
    </div>

   
    
      
    
	</body>
</template>

<script>
import $ from 'jquery'
import api from "axios";
export default {
  data() {
    return {
      hands : true,
      comms : false,
      rules : false,
      report : false,
    };
  },
  
  methods: {
    hand() {
      this.hands = true;
      this.comms = false;
      this.rules = false;
      this.report = false;
     
    },
    coms() {
      this.comms = true;
      this.hands = false;
      this.rules = false;
      this.report = false;
    },
    ruls() {
      this.rules = true;
      this.comms = false;
      this.hands = false;
      this.report = false;
      
    },

    rep() {
      this.report = true;
      this.rules = false;
      this.comms = false;
      this.hands = false;
    }
    
  },
  

  

};


$(function ()  {
  'use strict';
  console.log("STARTED")
  function display(bool) {
    if (bool) {
      $("#main").show();
      $("#info1").show();
      $("#info2").show();
      $("#info3").show();
      $("#report").show();
    } else {
      $("#main").hide();
      $("#info1").hide();
      $("#info2").hide();
      $("#info3").hide();
      $("#report").hide();
    }
  }

  display(false)

  window.addEventListener('message', function(event) {
      var item = event.data;
      console.log(event.data.type)
      if (item.type === "tablet") {
        if (item.status == true) {
          display(true)
        } else {
          display(false)
        }
      }
  })

  
  $(document).on('keydown', function(e) {
    switch(e.key) {
      case "Escape":
        $.post('https://rs_help/exit', JSON.stringify({}));
        display(false)
        break;
  }
});


})


  
</script>

<style>
header {
  -webkit-user-select: none; /* Safari */
  -ms-user-select: none; /* IE 10 and IE 11 */
  user-select: none; /* Standard syntax */

}
div {
  -webkit-user-select: none; /* Safari */
  -ms-user-select: none; /* IE 10 and IE 11 */
  user-select: none; /* Standard syntax */
}

body {
  color: aqua;
  -webkit-user-select: none; /* Safari */
  -ms-user-select: none; /* IE 10 and IE 11 */
  user-select: none; /* Standard syntax */
}



.button4 {
  text-align: center;
  text-shadow: #333;
  color: aliceblue;
  font-size: 12px;
  background-color: black;
  height: 50px;
  margin-left: 2.5%;
  width: 80px;
  border-radius: 80%;
  margin-top: 2%;
}

.button3 {
  text-align: center;
  text-shadow: #333;
  color: aliceblue;
  font-size: 12px;
  background-color: black;
  height: 50px;
  margin-left: 2.5%;
  width: 80px;
  border-radius: 80%;
  margin-top: 2%;
}

.button2 {
  text-align: center;
  text-shadow: #333;
  color: aliceblue;
  font-size: 12px;
  background-color: black;
  height: 50px;
  margin-left: 2.5%;
  width: 80px;
  border-radius: 80%;
  margin-top: 2%;
}

.button1 {
  text-align: center;
  text-shadow: #333;
  color: aliceblue;
  font-size: 12px;
  background-color: black;
  height: 50px;
  margin-left: 2.5%;
  width: 80px;
  border-radius: 80%;
  margin-top: 2%;
}
.button1:hover {
  background-color: rgb(78, 197, 157);
}
.button2:hover {
  background-color: rgb(78, 197, 157);
}
.button3:hover {
  background-color: rgb(78, 197, 157);
}
.button4:hover {
  background-color: rgb(78, 197, 157);
}
.buttons {
  border-radius: 10%;
  display: grid;
  background-color: rgb(66, 66, 66);
  height: 50%;
  width: 9%;
  justify-content: space-between;
  text-align: center;
  margin-top: 5%;
  
  
}
.title {
  text-align: center;
  font-size: 24px;
}
.main {
  background-color: black;
  display: block;
  position: absolute;
  width: 50%;
  height: 60%;
  margin-left: 23%;
  margin-top: 6%;
  border-radius: 20px;
  outline: 20%;
  outline-color: aqua;
  outline-style: inset;
  color: antiquewhite;
}

.info1 {
  text-align: center;
  position: absolute;
  background-color: rgb(84, 84, 84);
  width: 75%;
  height: 85%;
  margin-left: 16%;
  margin-top: -36%;
  border-radius:2%;

}

.info2 {
  text-align: center;
  position: absolute;
  background-color: rgb(84, 84, 84);
  width: 75%;
  height: 85%;
  margin-left: 16%;
  margin-top: -36%;
  border-radius:2%;

}

.info3 {
  text-align: center;
  position: absolute;
  background-color: rgb(84, 84, 84);
  width: 75%;
  height: 85%;
  margin-left: 16%;
  margin-top: -36%;
  border-radius:2%;
 

}

.report {
  text-align: center;
  position: absolute;
  background-color: rgb(84, 84, 84);
  width: 75%;
  height: 73%;
  margin-left: 16%;
  margin-top: -36%;
  border-radius:2%;

}

.doc {
  -webkit-user-select: none;
  -webkit-touch-callout: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}


</style>
