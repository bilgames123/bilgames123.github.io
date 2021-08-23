Supplement of "HERGM: Hierarchical Exponential-Family Random Graph Models"

The results in "HERGM: Hierarchical Exponential-Family Random Graph Models" are based on the R package hergm version 2.2-2.
The R package hergm is distributed under the GPL-3 license.

The R package hergm version 2.2-2 can be installed as follows:
R CMD INSTALL hergm_2.2-2.tar.gz

The supplement contains:
- the R package hergm version 2.2-2 used in the three applications of "HERGM: Hierarchical Exponential-Family Random Graph Models": hergm_2.2-2.tar.gz
- the R scripts used in the three applications of "HERGM: Hierarchical Exponential-Family Random Graph Models".
The R scripts can be divided into 4 categories:
(a) data
(b) model specification and estimation
(c) model goodness-of-fit
(d) clustering.
We list the R scripts by section.

Section 7.1 "Terrorist network":
(a) data:
bali_plot.r
(b) model specification and estimation:
- model "edges + triangle": bali_markov.r 
- model "edges_ij + triangle_ijk" with known main and support group: bali_complete.r
- model "edges_ij + triangle_ijk" with known support group: bali_partial.r
- model "edges_ij + triangle_ijk" with unknown neighborhood memberships and "max_number=2": bali_2.r
- model "edges_ij + triangle_ijk" with unknown neighborhood memberships and "max_number=3": bali_3.r
- model "edges_ij + triangle_ijk" with unknown neighborhood memberships and "max_number=4": bali_4.r
- model "edges_ij + triangle_ijk" with unknown neighborhood memberships and "max_number=5": bali_5.r
- model "edges_ij + triangle_ijk" with unknown neighborhood memberships and "max_number=6": bali_6.r
- model "edges_ij + triangle_ijk" with unknown neighborhood memberships and "max_number=7": bali_7.r
- model "edges_ij + triangle_ijk" with unknown neighborhood memberships and "max_number=8": bali_8.r
- model "edges_ij + triangle_ijk" with unknown neighborhood memberships and "max_number=9": bali_9.r
- model "edges_ij + triangle_ijk" with unknown neighborhood memberships and "max_number=10": bali_10.r
- model "edges_ij + triangle_ijk" with unknown neighborhood memberships and "max_number=10": bali.blocks.r
(c) model goodness-of-fit:
- model "edges + triangle": bali.markov.postprocessing.r
- model "edges_ij + triangle_ijk" with unknown neighborhood memberships and "max_number=5": bali.postprocessing.r
(d) clustering:
- model "edges_ij + triangle_ijk" with unknown neighborhood memberships and "max_number=5": bali.postprocessing.r

Section 7.2 "Friendship network":
(a) data:
VRND32T6.DAT
and
bunt_plot.r
(b) model specification and estimation:
- model "edges + mutual + ttriple": bunt_markov.r
- model "edges_ij + mutual_ij + ttriple_ijk" with unknown neighborhood memberships and "max_number=2": bunt_2.r
- model "edges_ij + mutual_ij + ttriple_ijk" with unknown neighborhood memberships and "max_number=3": bunt_3.r
- model "edges_ij + mutual_ij + ttriple_ijk" with unknown neighborhood memberships and "max_number=4": bunt_4.r
- model "edges_ij + mutual_ij + ttriple_ijk" with unknown neighborhood memberships and "max_number=5": bunt_5.r
- model "edges_ij + mutual_ij + ttriple_ijk" with unknown neighborhood memberships and "max_number=6": bunt_6.r
- model "edges_ij + mutual_ij + ttriple_ijk" with unknown neighborhood memberships and "max_number=7": bunt_7.r
- model "edges_ij + mutual_ij + ttriple_ijk" with unknown neighborhood memberships and "max_number=8": bunt_8.r
- model "edges_ij + mutual_ij + ttriple_ijk" with unknown neighborhood memberships and "max_number=9": bunt_9.r
- model "edges_ij + mutual_ij + ttriple_ijk" with unknown neighborhood memberships and "max_number=10": bunt_10.r
- model "edges_ij + triangle_ijk" with unknown neighborhood memberships and "max_number=10": bunt.blocks.r
(c) model goodness-of-fit:
- model "edges + mutual + ttriple": bunt.markov.postprocessing.r
- model "edges_ij + mutual_ij + ttriple_ijk" with unknown neighborhood memberships and "max_number=10": bunt.postprocessing.r
(d) clustering:
- model "edges_ij + mutual_ij + ttriple_ijk" with unknown neighborhood memberships and "max_number=10": bunt.clustering.r

Section 7.3 "Collaboration network":
(a) data:
kapferer.RData
and
kapferer_plot.r
(b) model specification and estimation:
- model "edges_i" with unknown neighborhood memberships and "max_number=2": kapferer_2.r
(c) model goodness-of-fit:
- model "edges_i" with unknown neighborhood memberships and "max_number=2": kapferer.postprocessing.r
(d) clustering:
- model "edges_i" with unknown neighborhood memberships and "max_number=2": kapferer.postprocessing.r

