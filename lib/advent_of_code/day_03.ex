defmodule AdventOfCode.Day03 do
  @priorities %{
    ?a => 1,
    ?b => 2,
    ?c => 3,
    ?d => 4,
    ?e => 5,
    ?f => 6,
    ?g => 7,
    ?h => 8,
    ?i => 9,
    ?j => 10,
    ?k => 11,
    ?l => 12,
    ?m => 13,
    ?n => 14,
    ?o => 15,
    ?p => 16,
    ?q => 17,
    ?r => 18,
    ?s => 19,
    ?t => 20,
    ?u => 21,
    ?v => 22,
    ?w => 23,
    ?x => 24,
    ?y => 25,
    ?z => 26,
    ?A => 27,
    ?B => 28,
    ?C => 29,
    ?D => 30,
    ?E => 31,
    ?F => 32,
    ?G => 33,
    ?H => 34,
    ?I => 35,
    ?J => 36,
    ?K => 37,
    ?L => 38,
    ?M => 39,
    ?N => 40,
    ?O => 41,
    ?P => 42,
    ?Q => 43,
    ?R => 44,
    ?S => 45,
    ?T => 46,
    ?U => 47,
    ?V => 48,
    ?W => 49,
    ?X => 50,
    ?Y => 51,
    ?Z => 52
  }

  def find_duplicate(collections) do
    collections
    |> Enum.map(&MapSet.new/1)
    |> Enum.reduce(fn xs, ys -> MapSet.intersection(xs, ys) end)
    |> MapSet.to_list()
    |> List.first()
  end

  defp split_pockets(rucksack) do
    Enum.chunk_every(rucksack, round(Enum.count(rucksack) / 2))
  end

  def part1(_args) do
    AdventOfCode.Day03.Input.rucksacks()
    |> Enum.map(fn rucksack ->
      @priorities[find_duplicate(split_pockets(rucksack))]
    end)
    |> Enum.sum()
  end

  def part2(_args) do
    AdventOfCode.Day03.Input.elf_groups()
    |> Enum.map(fn elf_group -> @priorities[find_duplicate(elf_group)] end)
    |> Enum.sum()
  end
end

defmodule AdventOfCode.Day03.Input do
  @input "vvMQnwwvrwWNfrtZJfppmSfJSmSg
BzGqjlBqBBmztHNFzDHg
llRCPlTPPqBjPhqhlBRBClhqWcTWrWNcMbQbdrdLccccrnvM
wMhwbTWpQjbpWHMQppzTHhjtlCjPSSJCCtlqRlJVFJFt
ggdvvnvDgdDmNcBrrcDntFRFqHJJtSJqvlVSRlJq
fggNNffGmcBrmBfcDzzzpHbsGTpszwwTbp
BPdPPBggrPtrpbtvPBBdgrFmhhQThGGlbbTZnzZQzZfn
ccjWRJVNcTGmnWWFmh
DMNmsMHwRNBrggdPDPdt
TfsfHLQbBtBFQbQsBmPwwlnPGZFwwdwWFZZw
MRpcvJMJVSMrVMpVSvhhnclwgWwDZgWgWgWglwcG
GCzjRJjVjSSrvfNQtLmQNsQbjB
FrSPFjtVvwsqSwcG
hDHdWDngpgZTDgHzzHwNNqlwNvZJlGqcQGsl
wDzLTDHgFffLtRft
CnCJNVqvCBJBNZmfPcPMcFLVcwmd
HgzjHFghSFtrLfwPchPM
QDpjgDSQlHHlDQQRzRzsBRRvWnWvJvZnqWBJNF
mGHcFPFqzPtcfPwDGVVpgLgSlgBl
rCvddTrnsbDLVSDwjSjd
QWhWQThswssMQMMMvhTzPqJzmzftHccJfHFhFm
cPbNpLVFTPbbFrpTLQBzqqmgnnBhgLMM
vvSwWCZCRZCDZtGwzdgWdQmzqgnQddJn
vCltGltCGmRRmCvDjjtHFpbcFfbbfssbpNPpHFpH
WLLQMWZLSPMPWmrwhnjhZZhpHJHljBDB
csbtCfFgCftGljHwHcBnpnJR
tsvgszNtfMwPzWqPrS
NbDZrbrFQQqqQtQqQDtTcBvCLBLswsZhscCGBZ
ljmWRzVRpbndMWmmfdsTsCBsGwTVVVCGCGws
ffRpnllHRMfdWzdnmRNQNNSFQQFNbrFHHrNH
LccGzWNjcvNLGTmHNsNLMlMwMpMPGlMCwFwDDGCw
fZZtfrZgrfQSnnnSnJRCglHpCwwHwpglDClFMw
SqJQnffJRnfQQVRhrQtrhnThcLhzNzHdTjhsTWzjdmcm
QJQwJMSbtbRgMQMQVZpCZsrrhpZBwrLLvs
qCNPGWdqhpphsWrB
DcNPNnqjdGDqjmPGGJRFMQmgtlQmQJCSgb
blTRbDnHRGGBwnGPCtFPWzVCDvFWtL
pdSJprqhhZSdqSdZNhVzZWtzLVgVPvzjLzWv
rrsqsmrMpPHlwTsRHn
mbNhgbRSLmTwswFm
vHjHBWMHBzMqWZVZBzHzcwwwdcFLcpLspdzwpwQd
HfMWMfvjWtZHqWDlhSnnnJNnbhslDb
lwsvPPnqlwwwsPcHTgqcRcSccmgQ
CVWBWCFpFzWfFjWjhNSQJJmcVcHRZJNTSc
zdhfzBtfLLtfFClbrDvsPvtPbnmv
PntVQbDnQHcDVvhtbtDhcbPcFTrrNfjqmmPTTZqMLZZMjFZm
lgJCpCFCSCGCpllWMfZqTNNZrMjrJTTM
CSzSwgFlzsGBzQcQhsnnDbVdtc
THzqvrVrWzhqhWwqhTbNNDRtFRmmpFDDVsFLLsdddF
MbZSSScZSGCJCjZlCjdPmpRmFLDtctdmFRsp
GfJQlnZjSMnllbJCQbClnZQrhNwwqhBzTNhrffqhqWhTqz
BdBdmDZHFFbrHHStPSRtPCzSRNDS
JGGpwqLJGMTLpLlMpqLhJtzCCSGQSPzNNczVVPVzSV
WwpllfslqfhffLwhfJpJlqlwdBmZnrdFHBFBBmNHFsFmdZmn
jZfQZnZfnbRfjCnfbSSmVpqmNmVpCqlhCqqPpP
MdJMwMvvLDssLtFMsMtLDsvvDRmmmPhWzWzphpmqDVzPDWNp
TsLdMrvRtLJtGdtGRRtFTBjSBrScnSZjnbcgQgHfnB
RZfmlRlWJmWLLRscrslJqvvMdVwmddvPddQPVDdDwz
GStFbFCbntbjNnjFhFvdHfhzHfzzQdMHwPdD
BSGpFbbjbNjnNNFSbRsLlWqgrZrfRgsBlg
ztHczmrmcNNzHsPSTwsPHSQPQT
CFCRjlvbClCjBdPDFQdwBsqn
llbRgjClJCVVMMCssfmNZWszrNgzGL
mmFldllVlmtdWFvPPFBcSSBW
DZzZGzZswQZHwQZjZzWWTSSvjSdvPvvWjJTS
DpQQggwzZGdmbCldgVgf
PJJvhqzVGbTFqzqbbGTlLmrtrZMnnZnntlJnrD
fNwRcQBCRNddNgLtgDnttqrMMtlr
RfRdNWQHcqHscdfRdGPFbFPpvpVWWzPzVS
DRgjZRRDggTfjfRvwWzHGGHPWDswvv
dhbmpcCmchgCpsGzWPdVGvWHwP
hpMMMpCQMnChFgNRQffTRrSN
gfqPCHWtPMMjCtffgjQWGLvGdZcdLLGZcLFGZBWG
pJTDsnnnvBjnFwvj
zJRpTbNrTSppRVblgbljMgMfCfbC
fGrGwqggtbVmtzbf
CTMjNQcJjJTBNCjMNZFNBcCZHbmWZHVLZDDWVtDzzbVmlV
hMvTcNMFMhQjTTBFBNMhwpspwgnGtvtnSgdwrRpG
RfFdqPdMMGPVgWmNVN
QwrTsbnSsSQpwlSSbNNWDmGLVjjmLWwNVB
rpcclTCprmZQSbprSTpRRRfqMfHHCHfhMhvFJM
LnJJsMtLbzsPPVPJbrTBlTWlfRfqnTrrlr
VDHVQNFGgNTrSjSBjq
CHFHGmvDGdZZGCQZVDgDHVbwLLwtMwwmJLJbLPPMbczt
qNNNBllFBzFjjzwGqGgLrWgrtQjdmmtQmQpp
ZMHJCPhMZRsRCsCPsSJZLmQdQgrtQwQwQZwdWg
CnMPbbRbsPhCnbfhMPRPllnFGqwTTFzTzNvBGBGc
wZWlBFZQgBzTzpZwBlVpzWBWnNMmnMvMcMJMmLGnVmqLqGMq
PdSDfJbCHsHHdJjsRRhjjPjmLqnnrLMLcrnLvdLMNccvGn
tSJtSCtbJhDhtzlFQZlTZTFp
TNqZDqmMDZNMFSGHjSGBRBdN
CrrwVwsPjjBHddPf
rpWggQVspQWcgtLwcHZZzDDMLDvvnnMzDM
lWrWmPwmGlZwZjdLZLzV
cFcDJhJnmqBqDCRpZzVLNsFLjLzdds
qJchTDCBHDWglmrfWPHH
RgLRnTJWnfHDcQQBfg
bZpNwdwbdMvVPsHHJMQfSSfP
mVbdNNdrbCzZbdZvbWTGrhqjTJtRWttRjq
TMtqqBJLrwqrZPlHHGhGnlBhzv
bFgNcpDRnpgggjCzvWDWhQhQWQHHvz
jnnVgjcgcTZMJqJVtT
dVSjmdHrfGPddrQgstFgzsQfsMFQ
hvJJCCJDcCtwBVFQzzBD
RWCnTvWTLRnJJLJllWhTLSprVdNZVGHGNGGnrdGSZH
gvMSHFZtBBMBMFZHzjnqLsLGMCzRWWMn
QJmDrhbNDbJfPQhDmQPRLszRlnjCzzWqrRnlsL
PcJVhJbJJNcNDmfDmjJmbhTfBvpwVSdggtgvgSFZwgvtgpdZ
PBClRHHClRlFljllZSBBBllppVGDLpZVVVsGpmGcNDpGLL
MvNwnbMwccVsswDG
MqnNbzMMrQfnqtttqfQWQQnRdCSHgHPglRFBRWlHjWRlCW
lldwdfSBWphHBggZghFs
DjDbDVRzDmLRzRLGJjPssrLZPhdshFHrssTZ
mvddMzvmmDDvvwQqWftCfqWqfM
gpTTwNWGWMSMgJjnvpvvJbJppn
lQvmLFdfrQzRFctlrLdRLVPnhPPbVDPDfjnVbfhJjV
FLFqccvmmtcQtrmQccRFLlRLSSWBSgTWNwsggqMBsqWGHMNG
PjPtVQrPVjrVPLLDQVFLTTWWqbSZwRwzqwSbSbbbwFSq
lBnGJBnfflRRNZwbqb
HJMGgmfpRMHGGdgncJHLDjjtVDQctLCvQCjTtr
VvmvjRGwRwvhmhRvvvVCCTTJjfWqfDMMcJlcCD
NpNbPfpSnngZbbLMFJWTMlLFqJJDMD
bNSfdSHQZgVQzwhhvRmQ
MhmHcDhChhcPVMDPDPQdFhQHnbNpZbZnprnrmNnjNbsllbnp
WWqGCWSCzsGbbGNgjN
LzwqBLSvwJCLPVMVDLdhMP
mNVLLffSLVWdZCcFZCZrSbGr
glvcwszTlsRDrHQCZFCvGH
gTBRlJnwhzgTgsTnggslsJRTpLNmjmNNcdVLdhfpLpdLVmLc
pCgfDrDrgccfppmDnhHMGqGbpHHSqzGLlqHS
tFtjQRPFFZRVNRcQGbLzLFMSGzSbWLqH
QRNTZjvjTTwtwNfmcTgfnCgnnBhm
hcPBhqPzqWPccHWHHWqnPdssPVfFFmZDnVDDms
NSLNCTRQZndRmDfnRD
QSGTGbjTSTJHBlbZZBbh
dgcWgVgWdvZSbbRtjLRZZZ
MMDPPfTnPTQrFDMpHzmmLztLnsszRtwbtS
rDfDqfHTpCSJqlCCGq
bjsgllstBbpNpslBpdBgqljgGwzJzDzwLGGrwLQQdJDwGhQh
nncmnmHHnmWRWmPfJCnvPRMrzvDhZZLGQwhDLhhMzZZZ
mffccVHRRPTTNlpNbNjJVslJ
DgPstgPtgPNNcjQQrtPJJCRSZTwSGJZZCZCJGD
dHVvpzdBBhVqzWqvhvHdzGSZlTRCSRJrwSSCwJCWGT
zpvVVqMBrzqrhFBvjbNPcPLnjcQtMcnj
gBcmTCFghhCCBnBhWWwFbwLdwHFMLMdp
LVzlZzPPMMzWWrwH
ljqjsGlZPPqqlVsPqDVqjQQctNTnRcNLtCNmmnRTRthBGG
LPRrrBNNjLBRJNdrGPRBfBrLwFqmDbdbTbTgmmgwmttFwtmH
QQcVvnQphlWsCQCCVpnvptTJgbtqwHDwbJtJHFsTHw
ppcJVQvpvMVMCvQZQVVZCCSRZPSjNRRZBPPPPzLjSLGf
MLtRnjQsRMJcDQJnSrsfqVVvGwbbbqgggg
WBFCNlFFFhFBlCHbplFWdpWZfVqPPwqTGdqTGvwrPVvTqvTr
HClCHzFzFBhmnjtQzMMSMnbD
sVnMCsdlMRcMFBGz
JvwwgrJDfgDmmggQrhNfhQQftjFrGRRtZFGBRZFHzjGcjrcj
PBJJvgDPNllPddVCPl
fmmRSnfnMnFSmMmmzTDSBFHtlJJqHJJqdHQdTCdtCCdt
WggGpNVVgWdwwHQtlGlC
hjbWppbLbLZLjVPPjPLSRRMvDlmSzDzBSnBFZf
nVttMPnPLjnJLjcnPVCjJJLcssfggBNlffgcNsWTcGcgNsBF
HQbwhmDrRrgFsWlQGNls
pZdbGzGrGpVttPLttv
LLbMrMHLDdWhmgbqqt
jGSQZQTpQGVVRSlQMQRljZmgmJBSvggvBWhJmJWvddmt
VjlQFGMVrFFrDrPw
DZVDwGZlJlVlwZVDzNdqfjMDnjqzNnWf
pmtpLRQFhSFpmpRgRtHNFznNdqWBjzWfnBjMWf
rHRrhStppHdJcGJrrssCsV
pgQqHwgPcPCddCjdWtdp
VfZGVFfNVhZhzjjjLz
fNNBBnGVNfBfRSRjBRQHJQTwJcJTgHPwTngr
MZdlzWzthMgrwmGmqZNqNs
VvJQJPVDBJQThwwNsRqsvRsHHm
BDQQPTnDDBQQBVfTBQPdFctzzdtztMMtnhcWcd
LjWjDShflZRRcZzfHH
srNwQPBsrVRhNmRGHzmM
rBdgQTrhdPndQTrsQQsrPwnTpLLCWDpSCLtCnvtSWpJjDCvl
gSlvDwCvcmcTQTFtRMjWHFVVHwtj
rbsphZZzBshGZssMffTVRFfFpWpfTH
GZNhZBhPBzTPNLDcDlCDCJNmlg
smZjGfvjbWWffQtf
dwRrdlVdDdgDbNtgcgQSNStQ
FdFVwdblFlzVrlwrTlndZHHZGhmLhhssjHhMjnjq
QFvQVFLLgVrFLBVgGhTtllPvmHRRGbTm
hDCCNCNCJNzWDZnqJDzSNCTnbRttHGRnccbPRtmmlmHc
qJshNMCNdVFVfsLB
FcLZZPFjdZcZMPcRjcRTgbpJlwbbTlmdTlGlwD
nrrNrHWBNSWvBqvvrhBqzStrgGnnmbwsbbJbwwJnmwmgJTlD
BCrrNvqWvSQPcCGZZRQQ
vPwcJblJzJbJcJFcwBSvJNdWRLtdsddGWWddWRWsMF
mDZmmDZDHVhfmjZgjVDfhTZHtsNptRsMntnWdsMnGtRntG
mhQrQDDhgqTTNfhmVQVBrPlBczSJbbCbCCPPvb
ZjbjLlbZjGqsgJTfHggrVvlB
tFDRFRnMFnnWtDdMdDRhzHfTJhJhffHvHTBHTgcfJV
nztDtdWzCCMSptSdFRRswZjsLbjwZmwqwGqpQV
vnvmmVnmVbrBJlzgWQWVNFzNHV
MwSjZhSwPjMwfDRzgWlNpWvHlgNNNP
CfSZjSfftwZDChDRSnccnrvBbbGrtBvctr
LCBRQRBQwRrCVLVWSrCSwCptzvhthvGGhdHzwppTTddv
mFnJJmnmFFFfPLNNmqqNJDpGnGtbHTtHvhnHbzvHvpGv
lMMPLqDmNMVSjjgMCS
zzPzbLjHLjfQPQHwwjddFNsNSJjDMsdNMFsC
BqqtmgDhcqdSFCdsqddF
GtcmrvhgcZlvZtBhtVgrvrvtnWzDnQbfnwlfWWRHWbbwzHRL
JfWHWZcMMdDLMPjRnCJjRbFgnblF
ShtBTSmBhTtqtfmqSTNvmjVjnFbFnnlrlqgCnrFnVg
vfzTTthppmdzPLHLWdGZ
tdvrvGgGTSScnHcjcg
zLLVfzPPcDZnPjSPpD
LfffNFLNlNbJwrctthWqNdNq
NdjJtfVNZnnFFdtfGfFNcvpbMDbzdcTbbzpvmcDR
PHMSHCHHWrRCvzDzDChT
BqPWSHwllSQWrLHQHPqlBBNfttZMjFQfjGtZtNjJJjnN
CpZtMCMQQpCVWjMDVjPVQsWWqJJhbTcddPlfhTRqchcJblhh
NwDSGNmGRccqNJfT
SBSSmgrrgGHnvSzwGVWDCzMCpLZtMsstLM
sbjHQsBlBQrrGjQjBqCRSnSCpnfngLnFhJngFfSP
zHVctHDcZtdJffnPpcSpFn
ZdwNMztdvzVdrqblvWsqHvBR
jPdjFPSbVDMMbqZzQWzQ
hFRrJlpprGhtlJGQzmCRmZBWQCHRQR
vThNplJpNhltNNlvcGDvwVFgnPwvSgPSSfjS
DhDTPQpTDmQbDQrrrWtWPJNNrrsJ
qqGjgwCgVRjMSRwMMGRGqjwvsNJJBZtrstvNBvHWHJvL
VqqgfjzfgfFGVjRggCGznhlbTpQchcshpdFlnDbn
DpTQTBbCZQVJQZJjrFllGdlvMPlMLqGBGvLl
hmnWHWWNzzmHsmWRlGGpdLgLHGlqvgqg
RzcWRhRnRnfmswfwtzzRWrDTrrFCQTCpQpcCrjjQCp
HLvpHvGcBTDFznvfqT
hCPQbPZPbjSbwwjCPChSClJJfzqTggTFDfsJngDg
StqmmZbdqrQmhQrrhZWcRcGBpBHWVcLctMWp
dNnRNbRdbRJMBMBVVThn
rNrsLNscFsCDjpwTMgBGWMGjJjWBVJ
wNcLpqHNsCprsfLFsHwRvPSSPRZRtRQSqtQPmP
PPhGfbthhBDVsTDtDqRR
mCmSNmqpcqjjrCScWRsZDpHsDQRZQDZDss
CcWzNmccrjjvqBGzzdPGnv
SDRmCSFfcSFFcfDmDBFSCfdVJhpzZjNJTNzRTvjzjhzNjTtZ
ngGsltrMWrblNpNTJJplJN
PGGnGsWngrGLQHHtHHHgWsHSBLqqfLcqBdVdcCDDBFdCDm
VPjGwhwVPhrnqhzJmQvQTQvmzBzw
ZBDBRbLLdtfRLlddLlCLCZMgmFJQFDcvzMQmgMzzJJFJ
LHLWltHlRZCtBVhVVHPjGSpphp
JqhlhdnnmfRVVSpzWLjzVLGpvB
stQtFTTrsZQPFQNNDtQgLzzSLvjvLGLBGSZGGWJv
DDDFFgDPbTwbTTJMCMcbCqqmmRRCnb
JbDWPDPPJJDMDjHPZHGbHGVZTBhrzBpdzszdTTphdNdWdrpv
RmRRqllqffwFtqwLCsqTNvpCsqCNqvdN
fmfLmStlnnfnRtfcnQbbjPjPPggZGVsMQMbb
WJggvGDJSwWgSfgvfSMGqqQHBcPjcHChcQBCssDHCTTQ
mlRnbrnbnltblwdnnpbLRdCCjCTHTjPTTsQcTrHHhCcj
bFLbdmzRpvSwfFFNWN
BHnDnQHnHMWLwzWPzD
dmlZCrdqLZzZVZJM
tRRtdlLCjLmqCRsrSLrvvRQNFQnbgRTQQNHTBbGQQh
ZrQPQWCrJnPdQSNTmBJNTHGHJN
zhFRfswjwhhsFttfsfvQftRtLTzmBTHGTBmzMLHHLmGHNTTS
hQhwqVjQwsdggrZZCWVl
VjfnQgVQjblChfjVJlbzLtrSLlTGtztHTtsTGH
DDqWQDQMWmDwWNwcqdWvpSrtLpLsptMprMStstMz
vQcddRdRvWcwWRmmmmddZmmfVnnngJJbZnCBnBhhFbhCgJ
gVgDnnmJdQVdJJgtgDjBsBhsBSPRSRRSSwccSbSqwPcCPcSC
HrQHlHFpQfTHzzWzwScPPCRfLbPSfCSR
TTQlZNTzlZNMWvrZMlpnhnVtnDDnVNtVJnjmhg
MCmmssFnZJcNNszfpvvrpvJzvwpp
BRRRWQWbSRGGRTTtZHWSqTrvDfgfdfrrwrDgfbvfzfrd
jRBhWRWTSRttQBZMNchNCsmFMchP
GBDncllqcSlNFZWBFWPjHVbw
LQphJlJzLCwPjHbpHZvV
hzCMJLMzTsrdrszQCCCTCQCDlqqnNmggqfGmgdmGgcmSNt
hFVVbqJsqhcnBRTRGBTh
lwdDpmzdNznzZBgGRRjR
HdmvNvSCmDmwNDFrMJMqJFCRfsbq
ctnbTcFTnbwSSfrrMLRhpJLMRdpwdJJR
vdGCVBmGVHPLBRWhpRLJJZ
VmQPHqvsPdlQsVHDftnlFTbffnbttfTF
LBJZHrhLThHddcMLVtcMcL
CPMNFDDMpGqFjjSPDPDqdvmdtQgVQQcQWcQgQQsj
DzFDFMRSFPSGTJJTJBwwRhBw
dpldqlqlRppFTHpbjbnLRLVnnGfjtG
NNJTcmhzvJQNgMJBwcGtjtGbttfhtsGGnhnt
rzcwmgvcvrBNvvmMgvcBzwHPCTWWprqPHqTFWdPCWDTF
BNllDRTNqDNvNDDLBcDvBCLVJrVdJdtrnrCHggtrdd
mppFMFjpMFZQZQGjFCdgrCrCdrvVGtJJCC
PZsQmfPphvPjSsjmPjfZllBwcNRDNcDqNNWbTclS
fjqZBSDSDwwsQwCDND
rrdMdjVWtTTPslsslFLTLCsJ
rvPWbvcmHjmdPbHvrvBHgqRRgqHGgfZGfHRS
ggTQgsgwFrTrggbMTvSdmjfCmmQDcmqjDjmc
nLZnRhNZnnNHZhZVStCcDqjcqmjSjH
RWGNnhzBnJJRRWNRBNZNLZhFMTFPvrTrTlsggPwSlFMWTw
RNmnPRnLGcQmzBQpHHjTltjtlfgspbsq
CZvCJwZMMCCMdFVcwJJsgTTHfsTlbfbgbT
SSVFhWCZdSCcWCcWdrvhzmnnnLNGDRDNzzLNGz
jPwfPwNfFpFNQpDjdMcjcrdddDHD
tzsRsGRLzhLhvqvhHMlqqV
LRBnRBGSnBSGsGSGmGtBJCmnNWZpPpTNPMwQMPNJFZTTNwWT
PCrStRPSPvZQcZPvqvfjSRWFFNFJFLZTTJTTVZFFGLFF
DlpBzBntHDzhlpGJVHLwTMFLVLTL
gptBBdgzpsBbpQvvPQPRqrdcCC"

  def rucksacks() do
    String.split(@input, "\n")
    |> Enum.map(&String.to_charlist/1)
  end

  def elf_groups() do
    rucksacks()
    |> Enum.chunk_every(3)
  end
end
