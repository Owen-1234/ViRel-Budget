# Reproducibility

## Lightweight verification

```bash
python -m venv .venv
source .venv/bin/activate
python -m pip install -e .
python -m unittest discover -s tests -v
python scripts/audit/verify_release.py
```

This validates the framework, restart behavior, energy attribution, manifest checksums, recorded result schemas, and release inventory without a GPU.

## Full model-backed execution

Full execution requires Linux, CUDA, one NVIDIA GPU with sufficient memory, separately obtained LLaVA-1.5 weights, official FastV and SCOPE implementations, and source-dataset images. Setup helpers are under `scripts/setup/`; recorded configs are under `configs/`.

The retained execution environment uses Python 3.10, PyTorch 2.8.0, torchvision 0.23.0, CUDA 12.8 wheels, and CodeCarbon 3.2.9. The SCOPE environment additionally pins Transformers 4.37.2, tokenizers 0.15.1, and accelerate 0.34.2. The FastV environment installs the Transformers and LLaVA packages included in the pinned FastV checkout and uses accelerate 0.21.0. The setup scripts are the authoritative executable environment specifications; do not replace them with the broader convenience dependencies in `pyproject.toml` for model-backed reproduction.

The official third-party repositories are intentionally not vendored. `scripts/setup/prepare_external_pruning_baselines.sh` checks out FastV commit `f95102a10acf31416f17ccf21b311c00d14ef49b`, SCOPE commit `6bf73069e0d61307051cfda8e25925bc7b7afdd9`, and the retained LLaVA-PruMerge extension commit `8989c4304db1f8aa22627ae3191a4b61d0f0cd51`. Apply `patches/fastv_random_pruning.patch` to the pinned FastV checkout for the deterministic Random baseline. Confirm license compatibility before redistribution.

The public repository omits large historical Phase A/Phase B grids. It contains their recorded summaries and the compact raw 210×3 repeated-workload artifacts. Paths inside archived protocols reflect the original execution environment and are evidence, not portable defaults.

## Reproducing the publication summaries

- Prospective results: inspect `results/prospective/`.
- Repeated-workload analysis: inspect or audit the historically named `results/replication/` directory.
- Carbon: inspect `results/carbon/experiment_run_ledger.csv` and its JSON summary.
- Pareto: inspect `results/pareto/`.
- Feature dependence: run `python scripts/analysis/run_feature_ablation.py` or inspect `results/feature_analysis/`.

Do not silently substitute hardware, model revisions, grid intensity, PUE, seeds, or intervention definitions. Record deviations as a new protocol.
