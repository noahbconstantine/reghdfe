* Config
	log close _all
	clear all
	discard
	cap cls
	set more off
	cd "C:/Git/reghdfe/test"

	rebuild_git reghdfe
	cap pr drop _all
	discard
	
* Run scripts
	adopath + "C:\Git\reghdfe\source\internal"
	adopath + "C:\Git\reghdfe\source\common"
	run test-absvars // Need to fix so we can find the path of the ADO
	adopath - "C:\Git\reghdfe\source\internal"
	adopath - "C:\Git\reghdfe\source\common"

	*run test-minimal
	set trace off
	set tracedepth 5
	set varabbrev on

	run test-unadjusted
	run test-slope-only
	run test-fvvarlist
	run test-robust
	run test-cluster
	run test-cluster-string
	run test-ivreg2
	run test-noabsorb

	run test-fvstrip // Test cases with complex factor variable 

	run test-zero

	run test-avar

	run test-dof

	run test-cluster-same-as-absvar
	run test-cluster-nested // Prevent regression of bug reported by Michael Wittry (see email)
	run test-vce-complex-bw
	run test-weights
	run test-mwc
	run test-ivreg2-nocons

	run test-weights-1clust
	run test-weights-2clust // 2 absvars and 2 clustervars

	run test-cont-interaction // fixes bug when the expansion of i.var#c.var  does not include base levels

	run test-gmm
	* Doesn't work: run test-cue
	run test-liml
	// run test-singletons
	run test-iv
	run test-slope

	run test-rank
	
	run test-postestimation-predict
	run test-postestimation-predict-pweight // predict after pweight
	run test-postestimation-stdp // predict stdp
	run test-postestimation-test
	run test-attach

	run test-cache

	run test-stages
	
	run test-hdfe // just tests that the syntax works, not for correctness

	* Don't run by default this as it's mostly a test about quipu.ado and not reghdfe.ado
	*run test-quipu

* Success
	di as text "No errors found!"
	clear
	exit
