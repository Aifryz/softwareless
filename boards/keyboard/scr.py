import pcbnew
import sys

#Simple script to load/store key positions from .csv file

path = "terminal.kicad_pcb"
def load():
	board = pcbnew.LoadBoard(path)
	switches = []
	for module in board.GetModules():
		pos = module.GetPosition()
		name = module.GetValue()
		ref = module.GetReference()
		if ref.startswith('SW'):
			sw = (ref, name, pos.x, pos.y)
			switches.append(sw)
			line = str(name)+'\t'
			line += str(ref)+'\t'
			line += str(pos.x/1e6)+'\t'
			line += str(pos.y/1e6)+'\t'
			print(line)
def do():
	board = pcbnew.LoadBoard(path)
	mod = board.FindModuleByReference("SW1").SetPosition(pcbnew.wxPointMM(25,17))
	board.Save(path)
	print(mod)

def store(pth):
	board = pcbnew.LoadBoard(path)
	with open(pth) as fil:
		for line in fil.readlines():
			parts = line.strip().split('\t')
			print(parts)
			pref = parts[1]
			px = parts[2].replace(',', '.')
			py = parts[3].replace(',', '.')
			board.FindModuleByReference(pref).SetPosition(pcbnew.wxPointMM(float(px),float(py)))
	board.Save(path)

if __name__=='__main__':
	#print(sys.argv)
	if sys.argv[1] == 'load':
		load()
	if sys.argv[1] == 'store':
		spath = sys.argv[2]
		store(spath)