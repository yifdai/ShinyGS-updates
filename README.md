# ShinyGS: A User-Friendly Genomic Selection Platform

ShinyGS is a user-friendly Genomic Selection (GS) software that integrates several powerful methods for breeding value prediction:

- rrBLUP  
- DNNGP3  
- BWGS (with new memory-efficient capabilities)

It is distributed as a Docker container for portability and ease of use.

## Installation

To use ShinyGS, you must have Docker installed on your computer.  
You can download Docker based on your system here:  
https://docs.docker.com/get-docker/

Once Docker is installed, pull the latest version of the software:

```
docker pull yfd2/ags:1.1.6
```

## Quick Start

1. Download the `Run.sh` file from this repository.

2. Move `Run.sh` to the folder where your genotype and phenotype files are located.

3. Genotype file format requirements:
   - If your genotype file is in **PLINK format** (`.bed`, `.bim`, `.fam`), the folder name must be the **prefix** of the PLINK files.
   - If your genotype file is in **VCF format**, the software will automatically convert it to PLINK format after quality control.

4. Launch the application:

```
bash Run.sh
```

This will start the ShinyGS app locally in your browser.

## Version History

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
