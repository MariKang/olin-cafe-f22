# Homework 4
The written portion is available [here](https://docs.google.com/document/d/1XybXmTD5-NTJ1gfLq3tYb-wUUDJGZS8xgO912DLf50Q/edit?usp=sharing)

Add a pdf of your written answers to this folder, then use `make clean` then `make submission` to submit!

## 32-bit Adder
To create the 32-bit adder, I first created 1-bit adder that addes two single bit. Then, using the 1 bit adder, I created 32-bit adder by calling the 1-bit adder function. This is the ripple carry adder, which is the slowest way to make 32 bit adder.

## 32-bit 32:1 Mux
To create the 32-bit 32:1 Mux, I started with 32-bit 2:1 Mux and expanded to 4:1, 8:1, 16:1, and 32:1. On the last page of the homework pdf, there is a drawing for 4:1 Mux, 8:1 Mux, 16:1 Mux and 32:1 Mux. For 4:1 Mux, we need two 2:1 Mux that shares same select, and another 2:1 Mux that combines the two outputs. In 8:1 Mux, we need two 4:1 Mux that share two selects, and another 2:1 Mux that combines the two outputs. With same logic, in 32:1 Mux, we need two 16:1 Mux that share four selects and another 2:1 Mux that combines the two outputs. I implemented all of the smaller Mux to compute the 32:1 Mux. 


## Test
To test the 32-bit adder, I tested overflowing and randomly generated numbers to see if it matches with the real sum.

To test the 32-bit 32:1 Mux, I manually tested, but I'm not sure exactly how I can test it. I am planning to go to next office hour after the lab to learn more about this part.

## How To Run Test
To run the test for adder, run 
```
make test_add32'.
```
To run the test for mux, run 

```
make test_mux32'.
```