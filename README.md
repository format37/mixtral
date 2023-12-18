# Docker image for Mixtral
### Installation
```
git clone https://github.com/format37/mixtral.git
cd mixtral
```
Choose your [model](https://huggingface.co/collections/mobiuslabsgmbh/mixtral-hqq-quantized-models-65776b2edddc2360b0edd451):
* 26 gb gpu:
```
sh download_4bit.sh
```
* 18 gb gpu:
```
sh download_2bit.sh
```
Set the corresponding model_id in app.py
### Inference
```
sh compose.sh
```
Input:
```
<s> [INST] How do I build a car? [/INST] 
```
Output:
```
mixtral_1  | INFO:__main__:Generated text:  [INST] How do I build a car? [/INST] 1. **Design and Planning:** The first step in building a car is to come up with a design and plan. This involves deciding on the type of car you want to build, such as a sedan, SUV, or sports car. You will also need to consider factors such as the size, engine power, transmission, and safety features.
mixtral_1  | 
mixtral_1  | 2. **Chassis and Suspension:** The chassis is the skeleton of the car, and it is responsible for the structural integrity of the vehicle. It is important to design a strong and lightweight chassis that can withstand the stresses of driving. The suspension system is also crucial for ensuring a smooth ride and safe handling.
mixtral_1  | 
mixtral_1  | 3. **Engine and Transmission:** The engine is the heart of the car, and it is responsible for converting chemical energy into mechanical energy. There are many different types of engines, such as gasoline, diesel, and electric. The transmission is responsible for transmitting the engine's power to the wheels.
mixtral_1  | 
mixtral_1  | 4. **Body and Interior:** The body of the car is what people see from the outside. It is important to design a body that is both attractive and aerodynamic. The interior of the car should be comfortable and functional, with features such as seats, controls, and displays.
mixtral_1  | 
mixtral_1  | 5. **Electrical Systems:** The electrical system is responsible for controlling the various functions of the car, such as the lights, wipers, and radio. It is important to design a reliable and efficient electrical system that can handle the demands of modern driving.
mixtral_1  | 
mixtral_1  | 6. **Testing and Regulation:** Once the car has been built, it is important to test it thoroughly to ensure that it meets all safety and performance standards. This involves conducting a series of tests, such as crash tests, emissions tests, and safety tests. The car must also meet all local and international regulations before it can be sold.
mixtral_1  | 
mixtral_1  | 7. **Production:** Once the car has been designed and tested, it is time to start production. This involves setting up a production line, where the car is assembled from various parts. The production process must be carefully managed to ensure that the car is built to a high standard and within budget.
mixtral_1  | 
mixtral_1  | 8. **Distribution and Sales:** Once the car has been built, it is time to sell it to customers. This involves setting up a distribution network, where the car is sold through dealerships or online. The car must also be marketed to the right audience, and this involves understanding the needs and wants of the target market.
mixtral_1  | 
mixtral_1  | Building a car is a complex process that requires a lot of expertise, resources, and time. It is important to have a clear understanding of the various stages involved in the process before starting production. By following a systematic approach, it is possible to build a high-quality car that meets all safety and performance standards.
```
### Comparison
Numbers for the base model and (comparison)(https://huggingface.co/mobiuslabsgmbh/Mixtral-8x7B-Instruct-v0.1-hf-2bit_g16_s128-HQQ/discussions/1) with bitsandbytes
```
Wikitext2 PPL/Memory: HQQ vs bitsandbytes (BNB)

#8-bit (group_size=128)
Mixtral-8x7B-v0.1 / BNB : 3.64 | (54.5 GB)
Mixtral-8x7B-v0.1 / HQQ : 3.63 | (47 GB)

#4-bit (group_size=64)
Mixtral-8x7B-v0.1 / BNB : 3.97 | (27 GB)
Mixtral-8x7B-v0.1 / HQQ : 3.79 | (26 GB)

#3-bit (group_size=128)
Mixtral-8x7B-v0.1 / HQQ : 4.76 | (21.8 GB)

#2-bit (group_size=16 | scale_g128/zero=8-bit):
Mixtral-8x7B-v0.1 / HQQ : 5.90 | (18 GB)
```
Thanks to [Mobius Labs GmbH](https://huggingface.co/mobiuslabsgmbh)