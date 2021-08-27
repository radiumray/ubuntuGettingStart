
const static uint8_t motor1A_PIN = 11;
const static uint8_t motor1B_PIN = 12;

//const static uint8_t motor1A_PIN = 9;
//const static uint8_t motor1B_PIN = 10;

const static uint8_t motor2A_PIN = 9;
const static uint8_t motor2B_PIN = 10;

const static uint8_t motor3A_PIN = 7;
const static uint8_t motor3B_PIN = 8;

const static uint8_t motor4A_PIN = 5;
const static uint8_t motor4B_PIN = 6;

const static uint8_t motorEN_PIN = 4;

void setup() {

  Serial.begin(115200);
  pinMode(motor1A_PIN, OUTPUT);
  pinMode(motor1B_PIN, OUTPUT);
  
  pinMode(motor2A_PIN, OUTPUT);
  pinMode(motor2B_PIN, OUTPUT);
  
  pinMode(motor3A_PIN, OUTPUT);
  pinMode(motor3B_PIN, OUTPUT);
  
  pinMode(motor4A_PIN, OUTPUT);
  pinMode(motor4B_PIN, OUTPUT);

  
  pinMode(motorEN_PIN, OUTPUT);

  digitalWrite(motor1A_PIN, LOW);
  digitalWrite(motor1B_PIN, LOW);
  
  digitalWrite(motor2A_PIN, LOW);
  digitalWrite(motor2B_PIN, LOW);
  
  digitalWrite(motor3A_PIN, LOW);
  digitalWrite(motor3B_PIN, LOW);
  
  digitalWrite(motor4A_PIN, LOW);
  digitalWrite(motor4B_PIN, LOW);
  
  digitalWrite(motorEN_PIN, HIGH);
  
}

void loop() {
  analogWrite(motor1A_PIN,60);
  digitalWrite(motor1B_PIN, LOW);
  Serial.println("motor1A_PIN");
  
  analogWrite(motor2A_PIN,60);
  digitalWrite(motor2B_PIN, LOW);

  analogWrite(motor3A_PIN,60);
  digitalWrite(motor3B_PIN, LOW);

  analogWrite(motor4A_PIN,60);
  digitalWrite(motor4B_PIN, LOW);
  
  delay(1000);

  digitalWrite(motor1A_PIN,LOW);
  digitalWrite(motor1B_PIN, LOW);
  
  digitalWrite(motor2A_PIN,LOW);
  digitalWrite(motor2B_PIN, LOW);
  
  digitalWrite(motor3A_PIN,LOW);
  digitalWrite(motor3B_PIN, LOW);
  
  digitalWrite(motor4A_PIN,LOW);
  digitalWrite(motor4B_PIN, LOW);
  
  delay(1000);

  analogWrite(motor1B_PIN,60);
  digitalWrite(motor1A_PIN, LOW);
  Serial.println("motor1B_PIN");
  
  analogWrite(motor2B_PIN,60);
  digitalWrite(motor2A_PIN, LOW);
  
  analogWrite(motor3B_PIN,60);
  digitalWrite(motor3A_PIN, LOW);
  
  analogWrite(motor4B_PIN,60);
  digitalWrite(motor4A_PIN, LOW);
  
  delay(1000);

  digitalWrite(motor1A_PIN,LOW);
  digitalWrite(motor1B_PIN, LOW);
  
  digitalWrite(motor2A_PIN,LOW);
  digitalWrite(motor2B_PIN, LOW);
  
  digitalWrite(motor3A_PIN,LOW);
  digitalWrite(motor3B_PIN, LOW);
  
  digitalWrite(motor4A_PIN,LOW);
  digitalWrite(motor4B_PIN, LOW);
  
  delay(1000);

}
