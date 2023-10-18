//
//  ContentView.swift
//  BrainTraining
//
//  Created by Arthur Tiradentes on 09/10/23.
//

import SwiftUI



struct ContentView: View {
    let opcoes = ["pedra", "papel", "tesoura"]
    @State private var escolhaApp = Int.random(in: 0..<3)
    @State private var deveVencer = Bool.random()
    @State private var placar: Int = 0
    @State private var rodadas: Int = 0
    @State private var fimDeJogo: Bool = false
    var totalRodadas = 5
    func novaRodada() {
        deveVencer.toggle()
        escolhaApp = Int.random(in: 0..<3)
    }
    
    func terminaJogo() {
        fimDeJogo.toggle()
    }
    
    func novoJogo() {
        placar = 0
        rodadas = 0
    }
    func analisePlacar(placar: Int) -> String{
        if placar > (totalRodadas/2) {
            return "Parabéns, seu cérebro está afiado! Continue assim!"
        } else {
            return "Continue praticando, o cérebro é como um músculo: fica mais forte com o uso!"
        }
    }
    var body: some View {
        NavigationView {
            ZStack {
                Color(red:0.4, green:0.5, blue:0.4)
                    .ignoresSafeArea()
                VStack (spacing: 10) {
                    Spacer()
                    Text("Exercício cerebral: Selecione a opção correta conforme o objetivo da rodada.")
                        .font(.footnote.italic())
                        .frame(maxWidth: 300)
                    Spacer()
                    Spacer()
                    Spacer()
                    Text("O app escolheu \(opcoes[escolhaApp].uppercased()).")
                    Text(deveVencer ? "Para DERROTÁ-LO você deve escolher:" : "Para ser DERROTADO, você deve escolher:")
                        .frame(maxWidth:330)
                    Spacer()
                    Section {
                        VStack (spacing: 40) {
                            Button (action: {
                                if opcoes[escolhaApp] == "tesoura" && deveVencer {
                                    placar += 1
                                    rodadas += 1
                                    novaRodada()
                                    
                                } else if opcoes[escolhaApp] == "papel" && !deveVencer {
                                    placar += 1
                                    rodadas += 1
                                    novaRodada()
                                } else {
                                    placar -= 1
                                    rodadas += 1
                                    novaRodada()
                                }
                                if rodadas == totalRodadas {
                                    terminaJogo()
                                }
                            }) {
                                Text("Pedra 🪨")
                                    .font(Font.title)
                                    .frame(minWidth: 250, minHeight: 60)
                                    .padding()
                                    .background(.green)
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                                    .font(.headline.weight(.bold))
                                    .foregroundColor(.white)
                            }
                            
                            Button (action: {
                                if opcoes[escolhaApp] == "pedra" && deveVencer {
                                    placar += 1
                                    rodadas += 1
                                    novaRodada()
                                    
                                } else if opcoes[escolhaApp] == "tesoura" && !deveVencer {
                                    placar += 1
                                    rodadas += 1
                                    novaRodada()
                                } else {
                                    placar -= 1
                                    rodadas += 1
                                    novaRodada()
                                }
                                if rodadas == totalRodadas {
                                    terminaJogo()
                                }
                            }) {
                                Text("Papel 📜")
                                    .font(Font.title)
                                    .frame(minWidth: 250, minHeight: 60)
                                    .padding()
                                    .background(.green)
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                                    .font(.headline.weight(.bold))
                                    .foregroundColor(.white)
                            }
                            
                            Button (action: {
                                if opcoes[escolhaApp] == "papel" && deveVencer {
                                    placar += 1
                                    rodadas += 1
                                    novaRodada()
                                    
                                } else if opcoes[escolhaApp] == "pedra" && !deveVencer {
                                    placar += 1
                                    rodadas += 1
                                    novaRodada()
                                } else {
                                    placar -= 1
                                    rodadas += 1
                                    novaRodada()
                                }
                                if rodadas == totalRodadas {
                                    terminaJogo()
                                }
                            }) {
                                Text("Tesoura ✂️")
                                    .font(Font.title)
                                    .frame(minWidth: 250, minHeight: 60)
                                    .padding()
                                    .background(.green)
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                                    .font(.headline.weight(.bold))
                                    .foregroundColor(.white)
                            }
                            
                            }
                        }

                    VStack {
                        Spacer()
                        Text("Placar: \(placar)")
                    }

                }
                .foregroundColor(.primary)
            }
            .navigationTitle("BrainTraining")
            .navigationBarTitleDisplayMode(.inline)
            .alert("Fim do jogo!", isPresented: $fimDeJogo) {
                Button("Jogar novamente", action: novoJogo)
            } message: {
                Text("Seu placar foi \(placar). ") +
                Text("\(analisePlacar(placar: placar))")
            }
        //navigation view
        }
    }
}
#Preview {
    ContentView()
}
