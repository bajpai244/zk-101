cd circuit_js
node generate_witness.js circuit.wasm ../input.json ../witness.wtns
cd ../
snarkjs plonk prove circuit_final.zkey witness.wtns proof.json public.json
rm witness.wtns