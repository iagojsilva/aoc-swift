import AOCShared
import Foundation

let input = try readInput(named: "PuzzleInput", bundle: .module)
var duplicates: [Int] = []

for range in input.split(separator: ",") {
    let expanded = expandRange(range: String(range))
    let duplicated = duplicates(range: expanded)
    duplicates.append(contentsOf: duplicated)
}

print(sum(values: duplicates))
