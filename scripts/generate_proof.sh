cd circuit_js
node generate_witness.js circuit.wasm ../input.json ../witness.wtns
cd ../
./node_modules/.bin/snarkjs plonk prove circuit_final.zkey witness.wtns proof.json public.json
rm witness.wtns