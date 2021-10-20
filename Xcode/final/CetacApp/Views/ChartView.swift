//
//  ChartView.swift
//  CetacApp
//
//  Created by Equipo 1 on 19/10/21.
//

import SwiftUI
import SwiftPieChart

struct ChartView: View {
    
    var values: [Double]
    var labels: [String]
    var format = "%.0f"
    var title = ""
    
    var body: some View {
        ScrollView {
            VStack {
                Text(title)
                    .font(.title2)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .padding()
                PieChartView(
                    values: values,
                    names: labels,
                    formatter: {value in String(format: format, value)},
                    colors: [Color.random, Color.random, Color.random, Color.random, Color.random, Color.random, Color.random, Color.random, Color.random, Color.random],
                    backgroundColor: Color(UIColor.systemBackground),
                    widthFraction: 0.95)
                    .padding()
            }
        }
    }
}

extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}

/*struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        //ChartView()
    }
}
*/
