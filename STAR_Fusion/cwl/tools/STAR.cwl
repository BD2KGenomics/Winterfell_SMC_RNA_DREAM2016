#!/usr/bin/env cwl-runner

cwlVersion: "v1.0"

class: CommandLineTool


requirements:
  - class: InlineJavascriptRequirement
  - class: DockerRequirement
    dockerPull: quay.io/ucsc_cgl/dockstore_tool_star_fusion
  - class: ResourceRequirement
    coresMin: 8
    ramMin: 80000

inputs:

  - id: index
    type: Directory

  - id: fastq1
    type: File
    inputBinding:
      position: 1
      prefix: --readFilesIn

  - id: fastq2
    type: File
    inputBinding:
      position: 2

  - id: twopassMode
    type: ["null",string]
    inputBinding:
      position: 3
      prefix: --twopassMode

  - id: outReadsUnmapped
    type: ["null",string]
    inputBinding:
      prefix: --outReadsUnmapped
      position: 4

  - id: chimSegmentMin
    type: ["null",int]
    inputBinding:
      prefix: --chimSegmentMin
      position: 5

  - id: chimJunctionOverhangMin
    type: ["null",int]
    inputBinding:
      prefix: --chimJunctionOverhangMin
      position: 6

  - id: alignSJDBoverhangMin
    type: ["null",int]
    inputBinding:
      prefix: --alignSJDBoverhangMin
      position: 7

  - id: alignMatesGapMax
    type: ["null",int]
    inputBinding:
      prefix: --alignMatesGapMax
      position: 8

  - id: alignIntronMax
    type: ["null",int]
    inputBinding:
      prefix: --alignIntronMax
      position: 9
      
  - id: chimSegmentReadGapMax
    type: ["null",string]
    inputBinding:
      prefix: --chimSegmentReadGapMax
      position: 10
    
  - id: chim2
    type: ["null",int]
    inputBinding:
      position: 11

  - id: alignSJstitchMismatchNmax
    type: ["null",int]
    inputBinding:
      prefix: --alignSJstitchMismatchNmax
      position: 12
      
  - id: align2
    type: ["null",int]
    inputBinding:
      position: 13
      
  - id: align3
    type: ["null",int]
    inputBinding:
      position: 14
      
  - id: align4
    type: ["null",int]
    inputBinding:
      position: 15

  - id: runThreadN
    type: ["null",int]
    inputBinding:
      prefix: --runThreadN
      position: 16
      
  - id: limitBAMsortRAM
    type: ["null",string]
    inputBinding:
      prefix: --limitBAMsortRAM
      position: 17
      
  - id: outSAMtype
    type: ["null",string]
    inputBinding:
      prefix: --outSAMtype
      position: 18

  - id: outSAMsecond
    type: ["null",string]
    inputBinding:
      position: 19

  - id: readFilesCommand
    type: ["null",string]
    inputBinding:
      prefix: --readFilesCommand
      position: 20

outputs:
  - id: output
    type: File
    outputBinding:
      glob: 'Chimeric.out.junction'

baseCommand: [STAR]
arguments:
  - valueFrom: $(inputs.index.path + "/ref_genome.fa.star.idx")
    position: 0
    prefix: --genomeDir
