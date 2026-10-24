func expandRange(range: String) -> [Int] {
    let numbers = range.split(separator: "-")
    return Array(Int(numbers[0])!...Int(numbers[1])!)
}

func duplicates(range: [Int]) -> [Int] {
    var found: [Int] = []
    for n in range {
        let nstr = String(n)

        for (index, _) in nstr.enumerated() {
            if index + 1 == nstr.count {
                break
            }
            let sub = nstr.prefix(index + 1)
            let chopped = nstr.chopped(into: index + 1)

            if chopped.allSatisfy({ str in sub == str }) {
                found.append(n)
                break
            }

        }

    }
    return found
}

func sum(values: [Int]) -> Int {
    var total = 0
    for value in values {
        total += value
    }
    return total
}

extension String {
    func chopped(into size: Int) -> [String] {
        var chunks: [String] = []
        var currentIndex = self.startIndex

        while currentIndex < self.endIndex {
            let nextIndex =
                self.index(currentIndex, offsetBy: size, limitedBy: self.endIndex) ?? self.endIndex
            let chunk = self[currentIndex..<nextIndex]
            chunks.append(String(chunk))
            currentIndex = nextIndex
        }

        return chunks
    }
}
