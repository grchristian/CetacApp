//
//  ChartTestView.swift
//  CetacApp
//
//  Created by Alejandro Hernandez on 07/10/21.
//

import SwiftUI
import BarChart

struct ChartTestView: View {
    
    let orientationChanged = NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
        .makeConnectable()
        .autoconnect()
    
    // MARK: - Chart Properties
    
    let chartHeight: CGFloat = 300
    let config = ChartConfiguration()
    
    // MARK: - Selection Indicator
    
    let selectionIndicatorHeight: CGFloat = 60
    @State var selectedBarTopCentreLocation: CGPoint?
    @State var selectedEntry: ChartDataEntry?
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 10) {
                    self.selectableChartView()
                    self.miniSelectableChartView()
                    Button(action: {
                        self.resetSelection()
                        self.config.data.entries = self.randomEntries()
                    }, label: {
                        Text("valores random")
                    })
                    .onReceive(self.orientationChanged) { _ in
                        self.config.objectWillChange.send()
                        self.resetSelection()
                    }
                    .onAppear() {
                        // SwiftUI bug, onAppear is called before the view frame is calculated
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                            self.config.data.entries = self.randomEntries()
                            self.config.objectWillChange.send()
                        })
                    }
                    .navigationBarTitle(Text("Reportes"))
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    
    // MARK: - Views
    
    func selectableChartView() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            self.selectionIndicatorView()
            self.chartView()
        }
        .frame(height: chartHeight)
        .padding(15)
    }
    
    func miniSelectableChartView() -> some View {
        SelectableBarChartView<MiniSelectionIndicator>(config: self.config)
            .onBarSelection { entry, location in
                self.selectedBarTopCentreLocation = location
                self.selectedEntry = entry
            }
            .selectionView {
                MiniSelectionIndicator(entry: self.selectedEntry,
                                       location: self.selectedBarTopCentreLocation)
            }
            .frame(height: self.chartHeight - self.selectionIndicatorHeight)
            .padding(15)
    }
    
    func chartView() -> some View {
        GeometryReader { proxy in
            SelectableBarChartView<SelectionLine>(config: self.config)
                .onBarSelection { entry, location in
                    self.selectedBarTopCentreLocation = location
                    self.selectedEntry = entry
                }
                .selectionView {
                    SelectionLine(location: self.selectedBarTopCentreLocation,
                                  height: proxy.size.height - 17)
                }
        }
    }
    
    func selectionIndicatorView() -> some View {
        Group {
            if self.selectedEntry != nil && self.selectedBarTopCentreLocation != nil {
                SelectionIndicator(entry: self.selectedEntry!,
                                   location: self.selectedBarTopCentreLocation!.x,
                                   infoRectangleColor: Color(red: 241/255, green: 242/255, blue: 245/255))
            } else {
                Rectangle().foregroundColor(.clear)
            }
        }
        .frame(height: self.selectionIndicatorHeight)
    }
    
    func randomEntries() -> [ChartDataEntry] {
        var entries = [ChartDataEntry]()
        for data in 0..<15 {
            let randomDouble = Double.random(in: -20...50)
            let newEntry = ChartDataEntry(x: "\(2000+data)", y: randomDouble)
            entries.append(newEntry)
        }
        return entries
    }
    
    func resetSelection() {
        self.selectedBarTopCentreLocation = nil
        self.selectedEntry = nil
    }
}

struct ChartTestView_Previews: PreviewProvider {
    static var previews: some View {
        ChartTestView()
    }
}

