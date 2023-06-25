# Comparative Analysis of Error Correction Coding Schemes: Hamming Codes, BCH Codes, and Convolutional Codes

This project aims to compare the performance of different coding schemes in terms of Bit Error Rate (BER) over Additive White Gaussian Noise (AWGN) and Binary Symmetric (BSC) channels. The three coding schemes considered are:

1. Linear Block Code: (15, 11) Hamming Code
2. Cyclic Code: (15, 5) BCH Code
3. Convolutional Code: (3, 1, 4) Convolutional Code (rate 1/3)

## Background

In modern digital communication over wireless channels, noise is introduced, which corrupts the received signal. To mitigate this, error-correcting coding schemes are employed. This project focuses on comparing the BER performance of linear block codes, cyclic codes, and convolutional codes.

Theoretical background information on linear block codes, Hamming codes, cyclic codes, BCH codes, convolutional codes, and the Viterbi algorithm is provided in the project documentation.

## Project Details

### Input
The project uses a random sequence of ones and zeros of length 10,000 as the input signal.

### Channel Coding
- **Hamming Codes**: A (15, 11) Hamming code is used, with the parity-check matrix used to generate the systematic parity check matrix H. Encoding is performed by multiplying the message by the generator matrix G.
- **BCH Codes**: A (15, 5) BCH code is employed, with the message multiplied by X^(n-k) and divided by g(X) to obtain the remainder. The remainder is then added to X^(n-k)m(X) to generate the codeword.
- **Convolutional Codes**: A (3, 1, 4) convolutional code is utilized. Encoding is performed based on the interlaced output of the shift registers.

### Modulation
Binary Phase Shift Keying (BPSK) is used for modulation, where zeros are mapped to +1 and ones to -1.

### Channels
Two types of channels are considered:
- **AWGN Channel**: Additive White Gaussian Noise is added to the transmitted signal.
- **BSC Channel**: Binary Symmetric Channel randomly flips bits with a specified probability.

### Demodulation
The received vector is compared with a threshold, and each component is quantized to obtain the estimate of the transmitted codeword.

### Channel Decoding
- **Hamming Codes**: Syndrome decoding is performed by comparing the received vector's syndrome with precalculated syndromes to identify the most likely errors.
- **BCH Codes**: Syndrome values are calculated, and error polynomials are obtained to determine error locations for error correction.
- **Convolutional Codes**: The Viterbi algorithm is used for decoding, where path metrics are computed for each path and decisions are made based on these metrics.

## Settings and Results

The project's settings include the parameters for each coding scheme and the simulation conditions, such as SNR values and BSC probability of bit flip. The results include BER performance curves for each coding scheme over AWGN and BSC channels.

1. Hamming Codes:
   - Performance over AWGN Channel: The (15, 11) Hamming code demonstrates excellent error correction capabilities in the presence of AWGN. As the signal-to-noise ratio (SNR) increases, the Bit Error Rate (BER) decreases significantly. At high SNR values, the BER approaches zero, indicating reliable transmission with minimal errors.
   ![Hamming Codes-AWGN](https://github.com/avaneesh2001/Comparative-Analysis-of-Coding-Schemes-for-Error-Rate-Performance-in-AWGN-and-BSC-Channels/blob/main/images/Hamming_AWGN.png)
   - Performance over BSC Channel: Hamming codes also perform well over the BSC channel, effectively correcting single bit errors. As the probability of bit flip in the BSC channel increases, the BER rises. However, due to the design of Hamming codes, they can also detect and correct burst errors to some extent, making them suitable for scenarios with occasional bursty noise.

2. BCH Codes:
   - Performance over AWGN Channel: The (15, 5) BCH code demonstrates superior error correction capabilities over the AWGN channel. It outperforms Hamming codes in terms of BER, especially at moderate to high SNR values. The BER decreases rapidly with increasing SNR, indicating robust error correction.
   - Performance over BSC Channel: BCH codes are less effective in handling burst errors in the BSC channel compared to Hamming codes. However, they still exhibit good error correction capabilities for single bit errors. As the probability of bit flip in the BSC channel increases, the BER gradually rises but remains relatively low compared to uncoded transmission.

3. Convolutional Codes:
   - Performance over AWGN Channel: The (3, 1, 4) convolutional code performs well over the AWGN channel, providing reliable error correction capabilities. The BER decreases as the SNR increases, indicating successful transmission. However, the BER for convolutional codes is slightly higher compared to Hamming and BCH codes at the same SNR values.
   - Performance over BSC Channel: Convolutional codes exhibit robust error correction capabilities over the BSC channel, similar to their performance in the AWGN channel. As the probability of bit flip increases, the BER gradually rises but remains relatively low compared to uncoded transmission. Convolutional codes are known for their ability to handle burst errors effectively.

Overall, the simulation results indicate that Hamming codes, BCH codes, and convolutional codes are all viable coding schemes for different communication scenarios. The choice of the coding scheme depends on the specific requirements of the system, such as the type of noise present, the desired error correction capabilities, and the complexity constraints. The results provide valuable insights into the performance trade-offs of each coding scheme, enabling system designers to make informed decisions based on their specific needs.

## Conclusion

Based on the simulation results, the performance comparison of the three coding schemes reveals the following:

1. Hamming Codes: The (15, 11) Hamming code demonstrates relatively good performance over both the AWGN and BSC channels. It provides significant error correction capabilities, especially for burst errors common in the BSC channel. However, it exhibits a higher complexity compared to other coding schemes.
2. BCH Codes: The (15, 5) BCH code offers excellent error correction performance, particularly in the AWGN channel. It can correct multiple errors and has lower complexity compared to Hamming codes. However, it is less effective in handling burst errors in the BSC channel.
3. Convolutional Codes: The (3, 1, 4) convolutional code performs well in both the AWGN and BSC channels. It provides good error correction capabilities with a relatively lower complexity compared to linear block codes. However, its performance is slightly lower than that of Hamming and BCH codes.

In conclusion, the choice of coding scheme depends on the specific requirements and characteristics of the communication system. Hamming codes and BCH codes are suitable for applications where burst error correction is crucial, while convolutional codes offer a good balance between performance and complexity. Further research and experimentation can be conducted to explore other coding schemes and optimize their parameters for specific scenarios.

## Usage

To reproduce the results or modify the project, follow the instructions provided in the project documentation. Ensure that the required dependencies and libraries are installed.

## Contributors

This project was developed by R Avaneesh as a mini project for Communication Engineering Lab 2 (NITC). Contributions, suggestions, and bug reports are welcome.
