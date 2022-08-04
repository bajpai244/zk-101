snarkjs powersoftau new bn128 12 pot12_0000.ptau -v
snarkjs powersoftau contribute pot12_0000.ptau pot12_0001.ptau --name="First contribution" -v -e="some random text 2"
snarkjs powersoftau contribute pot12_0001.ptau pot12_0002.ptau --name="Second contribution" -v -e="some random text"
snarkjs powersoftau export challenge pot12_0002.ptau challenge_0003
snarkjs powersoftau challenge contribute bn128 challenge_0003 response_0003 -e="some random text"
snarkjs powersoftau import response pot12_0002.ptau response_0003 pot12_0003.ptau -n="Third contribution name"
snarkjs powersoftau verify pot12_0003.ptau
snarkjs powersoftau beacon pot12_0003.ptau pot12_beacon.ptau 0102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f 10 -n="Final Beacon"
snarkjs powersoftau prepare phase2 pot12_beacon.ptau pot12_final.ptau -v
rm pot12_0000.ptau 
rm pot12_0001.ptau 
rm pot12_0002.ptau 
rm pot12_0003.ptau 
rm pot12_0001.ptau
rm pot12_0002.ptau
rm pot12_0003.ptau
snarkjs powersoftau verify pot12_final.ptau
circom circuit/circuit.circom --r1cs --wasm --sym
snarkjs r1cs export json circuit.r1cs circuit.r1cs.json
cat circuit.r1cs.json
snarkjs plonk setup circuit.r1cs pot12_final.ptau circuit_final.zkey
snarkjs zkey export verificationkey circuit_final.zkey verification_key.json
rm pot12_final.ptau 
rm pot12_beacon.ptau
rm response_0003
rm circuit.r1cs
rm circuit.r1cs.json
rm challenge_0003
rm circuit.sym