import AOCShared
import Foundation

let input = try readInput(named: "PuzzleInput", bundle: .module)
let instructions = input.split(whereSeparator: \.isNewline)
let zeroCrossingCount = try countZeroCrossings(in: instructions)

print("Password: \(zeroCrossingCount)")
