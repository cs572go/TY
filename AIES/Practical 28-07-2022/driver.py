from astaralgo import Astar_search
from puzzle import Puzzle

state=[[8,6,7,
        5,3,4,
        2,1,0]]

Puzzle.num_of_instances = 0
astar = Astar_search(state[0])
print('A*:',astar)
print('space:', Puzzle.num_of_instances)
