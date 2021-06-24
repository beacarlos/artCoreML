//
//  Mock.swift
//  Art
//
//  Created by Beatriz Carlos on 22/06/21.
//

import Foundation

class Mock {
    static let shared = Mock()
    var data = [String: Author]()
    
    init() {
        insertData()
    }
    
    private func insertData() {
        self.data["albrecht_durer"] = Author(author: "Albrecht Durer", biography: "Albrecht Dürer nasceu em 21 de maio de 1471, em Nuremberg, filho de ourives que emigrara da Hungria. Sua mãe, Barbara Holper, era filha do mestre de seu pai. O casal teve 18 filhos – e Albrecht foi o terceiro.\n\n Quando criança frequentou a escola latina local e ali conheceu Willibald Pirckheimer, jovem da nobreza, que mais tarde se tornaria um respeitado estudioso humanista, ficaram amigos e manteriam correspondência por toda a vida. Depois de deixar a escola, Dürer estudou, como era costume, o ofício de ourives, na oficina paterna. Já demonstrava sinais de seu extraordinário talento artístico.", birthDate: "21/05/1471", deathDate: "06/04/1528 (aos 57 anos)", occupation: "Pintor Alemão", works_of_art: ["Os quatro cavaleiros do Apocalipse (1498)", "São Miguel arcanjo combate Satã (1498)"])
        
        self.data["alfred_sisley"] = Author(author: "Alfred Sisley", biography: "Alfred Sisley foi um importante pintor francês (com nacionalidade britânica) do século XIX. É considerado um dos grandes representantes do Impressionismo, destacando-se como paisagista. Estudou pintura com grandes representantes da arte europeia do século XIX como, por exemplo, Monet, Renoir e Frédéric Bazille.\n\nAlfred Sisley nasceu na cidade de Paris (França) em 30 de outubro de 1839. Faleceu, aos 59 anos, na cidade de Moret-sur-Loing (França) em 29 de janeiro de 1899. Sua obra foi reconhecida apenas após sua morte.\n\nSua obra foi muito influenciada pelos seguintes artistas plásticos: Gustave Courbet (pintor realista francês), John Costable (pintor romântico inglês) e Willian Turner (pintor romântico inglês).", birthDate: "30/10/1839", deathDate: "29/01/1899 (aos 59 anos)", occupation: "Pintor Francês", works_of_art: ["O canal Saint-Martin em Paris (1870)", "A ponte em Argenteuil (1872)", "Ponte no Villeneuve-la-Garenne (1872)", "A máquina de Marly (1873)"])
        
        self.data["amedeo_modigliani"] = Author(author: "Amedeo Modigliani", biography: "Amedeo Clemente Modigliani foi um importante pintor e escultor italiano. Nasceu em 12 de julho de 1884 na cidade de Livorno (Itália) e faleceu em 24 de janeiro de 1920 na cidade de Paris. De família judaica, Modigliani construiu quase toda sua carreira nas artes plásticas em Paris. Modigliani pertenceu a Moderna Escola de Paris (grupo de artistas que trabalharam nesta cidade no período entre as duas guerras mundiais).", birthDate: "12/07/1884", deathDate: "24/01/1920 (aos 35 anos)", occupation: "Pintor italiano", works_of_art: ["Cabeça de uma mulher com chapéu (1907)", "Cabeça de uma jovem mulher (1908)", "A judia (1908)", "Retrato de Pedro (1909)"])
        
        self.data["edvard_munch"] = Author(author: "Edvard Munch", biography: "Munch foi um dos principais representantes do expressionismo pictórico alemão. Com seu primeiro retrato, A Criança Doente (1885-1886), colocou-se na fronteira da inteligibilidade artística vigente até aquele momento. Seu estilo pictórico, profundamente expressivo, abandonava o naturalismo reinante. A primeira grande exposição que realizou, em Berlim, no ano de 1893, provocou grande escândalo e foi fechada. Esse foi o pretexto para a criação da chamada Secessão berlinense, na qual expôs, em 1902, os 22 retratos de seu friso vital. O ciclo, que foi composto entre 1892 e 1902, representa o ponto culminante da obra de Munch. Os motivos giram em torno da vida e da morte, do amor, do med... - Veja mais em https://educacao.uol.com.br/biografias/edvard-munch.htm?cmpid=copiaecola", birthDate: "12/12/1863", deathDate: "23/01/1944 (aos 80 anos)", occupation: "Pintor norueguês", works_of_art: ["Spring Day on Karl Johan (1891)", "Evening on Karl Johan (1892)", "Melancolia (1892)", "Ansiedade(1894)"])
    
        
        self.data["vincent_van_gogh"] = Author(author: "Vincent van Gogh", biography: "Vincent Willem Van Gogh nasceu no dia 30 do mês de março do ano de 1853 em Groot-Zundert que é uma aldeia próxima á Breda que fica na província de Brabante do Norte, sul da Holanda. No ano de 1866 foi estudar na Willem II Colégio em Tilburg e lá conheceu Constantijn C. Huysmans que era um grande artista e começou a lhe ensinar a desenhar e com isso ele passou a se interessar pela arte.\n\nDesde bem jovem seus desenhos já eram muito bem feitos e expressivos, mais tarde passou a adquirir técnicas incríveis que deixou seu trabalho perfeito. O pintor estudou em Bruxelas onde aprendeu algumas regras padrão para modelagem e com isso passou a pintar telas lindíssimas. Apesar de ter tentado ter outros trabalhos fora da arte ele não conseguiu, pois seu dom era para desenho e com isso se tornou um pintor de renome.", birthDate: "30/03/1853", deathDate: "29/07/1890 (aos 37 anos)", occupation: "Pintor Holandês", works_of_art: ["teste"])
    }
    
    func getAuthor(authorID: String) -> Author? {
        return data[authorID]
    }
}
