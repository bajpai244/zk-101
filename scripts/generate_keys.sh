./node_modules/.bin/snarkjs powersoftau new bn128 12 pot12_0000.ptau -v
./node_modules/.bin/snarkjs powersoftau contribute pot12_0000.ptau pot12_0001.ptau --name="First contribution" -v -e="some random text 2"
./node_modules/.bin/snarkjs powersoftau contribute pot12_0001.ptau pot12_0002.ptau --name="Second contribution" -v -e="some random text"
./node_modules/.bin/snarkjs powersoftau export challenge pot12_0002.ptau challenge_0003
./node_modules/.bin/snarkjs powersoftau challenge contribute bn128 challenge_0003 response_0003 -e="some random text"
./node_modules/.bin/snarkjs powersoftau import response pot12_0002.ptau response_0003 pot12_0003.ptau -n="Third contribution name"
./node_modules/.bin/snarkjs powersoftau verify pot12_0003.ptau
./node_modules/.bin/snarkjs powersoftau beacon pot12_0003.ptau pot12_beacon.ptau 0102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f 10 -n="Final Beacon"
./node_modules/.bin/snarkjs powersoftau prepare phase2 pot12_beacon.ptau pot12_final.ptau -v
rm pot12_0000.ptau 
rm pot12_0001.ptau 
rm pot12_0002.ptau 
rm pot12_0003.ptau 
rm pot12_0001.ptau
rm pot12_0002.ptau
rm pot12_0003.ptau
./node_modules/.bin/snarkjs powersoftau verify pot12_final.ptau
./node_modules/.bin/snarkjs r1cs export json circuit.r1cs circuit.r1cs.json
./node_modules/.bin/snarkjs plonk setup circuit.r1cs pot12_final.ptau circuit_final.zkey
./node_modules/.bin/snarkjs zkey export verificationkey circuit_final.zkey verification_key.json
rm pot12_final.ptau 
rm pot12_beacon.ptau
rm response_0003
rm circuit.r1cs
rm circuit.r1cs.json
rm challenge_0003
rm circuit.sym