# ShinyGS: A User-Friendly Genomic Selection Platform

ShinyGS is a user-friendly Genomic Selection (GS) software that integrates several powerful methods for breeding value prediction:


<img width="1467" height="785" alt="image" src="https://github.com/user-attachments/assets/85d3994c-36c8-4a3b-8539-238f5f260269" />


- rrBLUP  
- LightGBM (GBM)  
- BWGS (with new memory-efficient capabilities)


It is distributed as a Docker container for portability and ease of use.


## Installation


To use ShinyGS, you must have Docker installed on your computer.  
You can download Docker based on your system here:  
https://docs.docker.com/get-docker/


Once Docker is installed, pull the latest version of the software:

'docker pull yfd2/ags:2.0.1'



## Quick Start


1. Download the `Run.sh` file from this repository.


2. Move `Run.sh` to the folder where your genotype and phenotype files are located.


3. Input file format requirements:
   - If your genotype file is in **PLINK format** (`.bed`, `.bim`, `.fam`), the folder name must be the **prefix** of the PLINK files.
   - If your genotype file is in **VCF format**, the software will automatically convert it to PLINK format after quality control.
   - The phenotype file could be (`.txt`, `.csv`) format, with the first column saves the sample ids, and each following column contains each phenotype that you would like to analyze.


4. Launch the application:

'bash Run.sh'



This will start the ShinyGS app locally in your browser at http://localhost:4040.

On the left panel you can follow the step-by-step guidance: choose a model, choose your data, set the model parameters, and run the analysis. We recommend using the "Generate match ids phenotype file" function first to align the sample IDs between your genotype and phenotype files. After the analysis is finished, click "Show Plot and Table" and select a trait to see the results.


## Version History


### Version 2.0.1 (2026-09-18)
- Fixed the rrBLUP crash caused by incorrect FAM file parsing
- Fixed the BWGS "unused arguments" error when the verbose/debug mode was off
- Fixed the BWGS prediction error ("argument matches multiple formal arguments")
- Fixed the kinship matrix reconstruction and sample ID alignment in the rrBLUP module
- Added a guard to avoid crashes when the population reduction size is too large
- Removed the DNNGP3 module
- Improved the user interface with clearer step-by-step guidance
- Added an automated test suite (37 tests) covering all model modules and conversion scripts
- Reduced the Docker image size from 47.5 GB to 3.7 GB


### Version 2.0.0 (2026-09-18)
- Fixed shell script syntax errors and missing preprocessing steps
- Added a complete reproducible Dockerfile
- Removed unused files and dependencies from the image


### Version 1.1.6 (2025-08-03)
- Added verbose/debug mode for BWGS methods
- Added marker count tracking and debugging
- Improved output messages for BWGS methods
- To avoid memory issues in the BWGS approach, added chunked reading and sparse matrix conversion for large genotype files


### Version 1.1.5 (2025-02-08)
- Fixed minor bugs related to genotype preprocessing
- Added checkbox for skipping the genotype preprocessing step


### Version 1.1.4 (2024-12-23)
- Initial release of ShinyGS
