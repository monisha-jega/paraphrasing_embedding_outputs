

cd eval-code/human-eval


# denoising
python3 sample_shuffle_data.py \
../../data/en-fr-paraphrase-john/eng-test.txt.tok.true \
../../dump/big_noisy_vmf/big/predictions \
../../dump/big_noisy_ce/big/predictions \
files/denoised_big/denoised_big




# supervised
python3 sample_shuffle_data.py \
../../data/paranmt/test.src \
../../dump/superpara_vmf/paranmt/predictions \
../../dump/superpara_ce/paranmt/predictions \
files/supervised_paranmt/supervised_paranmt