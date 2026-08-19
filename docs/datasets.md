# Dataset protocol

## Sources and versions

The study uses three task-diverse sources represented in balanced strata:

- [MMStar](https://huggingface.co/datasets/Lin-Chen/MMStar), configuration `val`, split `val`;
- [POPE](https://huggingface.co/datasets/lmms-lab/POPE), configuration `Full`, splits `adversarial`, `popular`, and `random`; and
- [Visual CounterFact](https://huggingface.co/datasets/mgolov/Visual-Counterfact), configuration `default`, splits `color` and `size`.

Each manifest row records the Hugging Face dataset identifier, configuration, split, and original row index or source identifier. Because upstream datasets can change, users should record the retrieved dataset revision and access date when reconstructing the images. The source datasets and underlying images remain governed by their providers' licenses and terms.

## Development and prospective populations

The 1,200-case pool is development-only. The 900 added cases were selected before inference, isolated from development by source group, protected by checksums, and kept label-hidden through prospective controller execution. Together they form the 2,100-query evaluation scope.

For the prospective population, the source-group key combines an exact image SHA-256 with a normalized exact non-template question when that question occurs fewer than five times. Repeated uses of the same source image remain in one group. The recorded manifest reports 819 source groups among 900 cases and no source-image overlap with development; see `data/manifests/prospective/frozen_manifest.json`.

## Repeated-workload draws

The historical directory `data/manifests/replication/` contains three fixed-seed, stratified 210-case workload draws. The directory name is retained for script and artifact compatibility; these draws are repeated robustness evaluations, not independent replications by a separate team. Draws are group-disjoint, and all compared systems within a draw receive exactly the same queries. Manifests, seeds, source groups, and checksums are retained under `data/manifests/`.

Full image data are not redistributed. Manifest rows preserve provenance and expected relative paths; users must obtain source images from the official providers above.
