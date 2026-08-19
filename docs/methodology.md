# Methodology

## Scientific target

ViRel-Budget does not collapse correctness and visual reliance into one opaque label. For each sample, model, pruning method, and budget it records:

- task correctness;
- agreement with the dense original answer;
- preservation of the dense intervention-response trajectory; and
- strict safety, the conjunction required by the deployment study.

The interventions are targeted counterfactual replacement, irrelevant-image replacement, blur, and the historical constant-gray null. They are supervision/evaluation instruments, not proof of semantic grounding.

An intervention is eligible only when the dense model is correct and meets the prespecified visual-evidence threshold for that intervention. A query with no eligible intervention is excluded from intervention-defined controller fitting and safety estimation; it is not treated as automatically safe through an empty conjunction. In the 900-case prospective population, the recorded zero-eligible counts are 296/900 for 7B SCOPE, 297/900 for 7B FastV, 297/900 for 7B Random, 253/900 for 13B SCOPE, 251/900 for 13B FastV, and 251/900 for 13B Random. Dataset-specific records are available in `results/controllers/labels/prospective/*/safe_budget_labels.csv`.

## Development and prospective protocol

The original 1,200 cases are treated as development data because the legacy validation/test partition contained related images and repeated questions. Group-aware development procedures are used to fit a low-capacity, cost-sensitive controller. The controller observes only metadata available before inference; it cannot access dense answers, intervention answers, hidden labels, or offline oracle budgets.

Before prospective execution, the feature schema, model, risk threshold, action set, fallback, and manifests were prespecified and recorded. Each evaluation query makes exactly one backend call. Hidden labels from the 900 added cases were revealed only after all six model/pruner executions were complete.

## Comparators

The study compares dense inference, fixed visual-token budgets, FastV, SCOPE, deterministic Random pruning, prespecified ViRel controllers, and the offline oracle upper bound where appropriate. Random uses a fixed sample-specific seed and the same token counts, isolating informed token selection from pruning quantity.

## Repeated-workload criterion

The principal GreenMM result uses three stratified, group-disjoint 210-case workload draws. A model/pruner cell satisfies the prespecified joint reliability-and-energy criterion only if:

1. unsafe acceptance remains below the prespecified risk criterion;
2. every draw has positive paired energy reduction relative to its matched dense calls; and
3. the pooled paired energy-reduction confidence interval has a positive lower bound.

Only 7B SCOPE and 13B SCOPE satisfy all three conditions.
