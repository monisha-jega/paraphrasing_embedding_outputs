
############ PARANMT #####################

# Supervised
REF="../data/paranmt/test.src"

# VMF
HYP="../dump/superpara_vmf/paranmt/predictions"
# CE
HYP="../dump/superpara_ce/paranmt/predictions"


############ BIG DATASET #####################

# Denoising - single model - English
REF="../data/en-fr-paraphrase-john/eng-test.txt.tok.true"

# VMF
HYP="../dump/big_noisy_vmf/big/predictions"
# CE
HYP="../dump/big_noisy_ce/big/predictions"


# Denoising - joint model - English
REF="../data/en-fr-paraphrase-john/eng-test.txt.tok.true"

# VMF
HYP="../dump/big_noisy_vmf_both/big/en/predictions"
# CE
HYP="../dump/big_noisy_ce_both/big/en/predictions"


# Denoising - joint model - French
REF="../data/en-fr-paraphrase-john/fren-test.txt.tok.true"

# VMF
HYP="../dump/big_noisy_vmf_joint/big/fr/predictions"
# CE
HYP="../dump/big_noisy_ce_joint/big/fr/predictions"


############ IWSLT #####################

# Autoencoding - English
REF="../data/kumarvon2018-data/fren/tst201516.tok.true.en"
# VMF
HYP="../dump/vmf/iwslt/predictions"
# CE
HYP="../dump/ce/iwslt/predictions"


# Bilingual Pivoting - English
REF="../data/kumarvon2018-data/fren/tst201516.tok.true.en"

# VMF
HYP="../dump/frenvmf/bp/iwslt/predictions"
# CE
HYP="../dump/frence/bp/iwslt/predictions"

# Backtranslation - English
REF="../data/kumarvon2018-data/fren/tst201516.tok.true.en"

# VMF
HYP="../dump/frenvmf/backtrans/iwslt/predictions"
# CE
HYP="../dump/frence/backtrans/iwslt/predictions"


# Ablation No token at Encoder VMF
REF="../data/kumarvon2018-data/fren/tst201516.tok.true.en"
HYP="../dump/ab_noenc/predictions"


# Ablation No autoencoding data VMF
REF="../data/kumarvon2018-data/fren/tst201516.tok.true.en"
HYP="../dump/ab_noauto/predictions"


# Autoencoding - Joint Model - English
REF="../data/kumarvon2018-data/fren/tst201516.tok.true.en"

# VMF
HYP="../dump/vmf_joint/iwslt/en/predictions"
# CE
HYP="../dump/ce_joint/iwslt/en/predictions"


# Autoencoding - French
REF="../data/kumarvon2018-data/fren/tst201516.tok.true.fr"

# VMF
HYP="../dump/vmffr/iwslt/predictions"
# CE
HYP="../dump/cefr/iwslt/predictions"


# Bilingual Pivoting - French
REF="../data/kumarvon2018-data/fren/tst201516.tok.true.fr"

# VMF
HYP="../dump/enfrvmf/frenpp/iwslt/predictions"
# CE
HYP="../dump/enfrce/frenpp/iwslt/predictions"


# Autoencoding - Joint Model - French
REF="../data/kumarvon2018-data/fren/tst201516.tok.true.fr"

# VMF
HYP="../dump/vmf_joint/iwslt/fr/predictions"
# CE
HYP="../dump/ce_joint/iwslt/fr/predictions"


# Autoencoding with Russian instead of French
REF="../data/kumarvon2018-data/fren/tst201516.tok.true.en"

# VMF
HYP="../dump/russian_vmf/iwslt/predictions"
# CE
HYP="../dump/russian_ce/iwslt/predictions"


############ PARANMT #####################

# Autoencoding - English
REF="../data/kumarvon2018-data/fren/tst201516.tok.true.en"
# VMF
HYP="../dump/vmf/paranmt/predictions"
# CE
HYP="../dump/ce/paranmt/predictions"


# Bilingual Pivoting - English
REF="../data/kumarvon2018-data/fren/tst201516.tok.true.en"

# VMF
HYP="../dump/frenvmf/bp/paranmt/predictions"
# CE
HYP="../dump/frence/bp/paranmt/predictions"

# Backtranslation - English
REF="../data/kumarvon2018-data/fren/tst201516.tok.true.en"

# VMF
HYP="../dump/frenvmf/backtrans/paranmt/predictions"
# CE
HYP="../dump/frence/backtrans/paranmt/predictions"



