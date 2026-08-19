# Results and interpretation

## Prospective validity

All six prespecified controllers completed the label-hidden 900-case protocol with one backend invocation per query and met the prespecified empirical unsafe-acceptance criterion. Results are reported by model and pruner rather than hidden in a pooled average. Energy was assessed separately on the repeated-workload population described below; it was not part of the 900-case prospective reliability test.

## Repeated-workload systems result

On three group-disjoint 210-case draws, SCOPE reduced call-window GPU energy by 11.87% for 7B and 10.62% for 13B relative to matched dense inference. Both confidence intervals exclude zero, and all six model-by-draw SCOPE reductions are positive.

FastV avoided dense inference more often, but its measured energy was statistically indistinguishable from—or slightly worse than—dense. Random increased energy at both scales. This is a useful negative result: token count, dense avoidance, latency, and energy are distinct systems outcomes.

## Model-scale frontier

The 13B backend improves dense accuracy relative to 7B but uses more energy and memory. The 500M audit has far lower memory but is slower on the tested implementation and does not dominate 7B. The repository therefore reports pairwise Pareto frontiers rather than declaring one model size universally preferable.

## Claim boundary

The supported claim is that ViRel-Budget supplies a reliability-aware evaluation framework and that SCOPE met the prespecified joint reliability-and-energy criterion on the tested workloads and hardware. This evidence does not certify deployment safety, establish transfer beyond the evaluated settings, show that every pruning method reduces energy, or prove universal visual grounding.
