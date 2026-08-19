# Energy, carbon, and cost measurement

## Primary device measurement

NVIDIA power telemetry is sampled every 200 ms and integrated over the backend call window. Each loaded model receives three warm-up queries; CUDA synchronization, fixed execution settings, paired queries, and counterbalanced order reduce measurement bias. Wrapper/model-load energy is retained separately from per-call attribution. The recorded GPU was an NVIDIA RTX PRO 6000 Blackwell Server Edition with a 600 W power limit and NVIDIA driver 580.159.03; per-run hardware records are retained with the raw repeated-workload telemetry.

## CodeCarbon

CodeCarbon 3.2.9 prospectively instruments the repeated-workload evaluation and other retained runs. Its energy is a secondary cross-check: it detected host-wide CPU/RAM resources larger than the assigned pod, so those CPU/RAM values are not treated as direct pod measurements.

## Carbon assumptions

- Hardware: one NVIDIA RTX PRO 6000 Blackwell Server Edition.
- Region: RunPod EUR-IS-1; CodeCarbon geolocation indicated Iceland.
- Central grid intensity: 0.03283 kgCO₂e/kWh, recorded as a study assumption rather than a contemporaneous direct measurement.
- Central PUE: 1.2, recorded as a scenario assumption rather than a measured facility value.
- Sensitivity: grid intensity 0.015–0.08 kgCO₂e/kWh and PUE 1.1–1.4.
- Cloud cost: USD 2.00/GPU-hour runtime proxy, not a billing statement or a current provider quotation.

The primary whole-program footprint is location/PUE-adjusted measured GPU energy. The grid-intensity, PUE, and cost values above are transparent scenario inputs; claims should not present them as measured properties of the provider. Pod idle time outside wrappers, embodied carbon, networking, and storage are excluded. Completed historical runs use direct stored NVIDIA measurements where available; CodeCarbon is never described as having retroactively measured them.

## Functional units

Reports include joules/query, latency/query, throughput, peak GPU memory, correct and intervention-supported answers/kWh, estimated gCO₂e/1,000 queries, dense avoidance at the risk limit, and pairwise Pareto status.
