// 1. Limpeza do Banco (Opcional)
MATCH (n) DETACH DELETE n;

// 2. Criando os Gêneros
CREATE (g1:Genero {nome: 'Rock'}), 
       (g2:Genero {nome: 'Pop'}), 
       (g3:Genero {nome: 'Sertanejo'}), 
       (g4:Genero {nome: 'R&B'}), 
       (g5:Genero {nome: 'Reggaeton'});

// 3. Criando Artistas
CREATE (a1:Artista {nome: 'Queen'}),
       (a2:Artista {nome: 'Anitta'}),
       (a3:Artista {nome: 'Marília Mendonça'}),
       (a4:Artista {nome: 'The Weeknd'}),
       (a5:Artista {nome: 'Justin Bieber'});

// 4. Criando Músicas
CREATE (m1:Musica {titulo: 'Bohemian Rhapsody', duracao: '5:55'}),
       (m2:Musica {titulo: 'Envolver', duracao: '3:13'}),
       (m3:Musica {titulo: 'Infiel', duracao: '3:20'}),
       (m4:Musica {titulo: 'Blinding Lights', duracao: '3:20'}),
       (m5:Musica {titulo: 'Stay', duracao: '2:21'});

// 5. Criando Usuários
CREATE (u1:Usuario {nome: 'João', idade: 25}),
       (u2:Usuario {nome: 'Maria', idade: 30}),
       (u3:Usuario {nome: 'Carlos', idade: 22}),
       (u4:Usuario {nome: 'Ana', idade: 28}),
       (u5:Usuario {nome: 'Pedro', idade: 35});

// 6. Conectando Músicas a Artistas (INTERPRETADA_POR)
CREATE (m1)-[:INTERPRETADA_POR]->(a1),
       (m2)-[:INTERPRETADA_POR]->(a2),
       (m3)-[:INTERPRETADA_POR]->(a3),
       (m4)-[:INTERPRETADA_POR]->(a4),
       (m5)-[:INTERPRETADA_POR]->(a5);

// 7. Conectando Músicas a Gêneros (PERTENCE_AO)
CREATE (m1)-[:PERTENCE_AO]->(g1),
       (m2)-[:PERTENCE_AO]->(g5),
       (m3)-[:PERTENCE_AO]->(g3),
       (m4)-[:PERTENCE_AO]->(g2),
       (m5)-[:PERTENCE_AO]->(g2);

// 8. Criando Interações de Usuários (ESCUTOU, CURTIU, SEGUE)
CREATE (u1)-[:ESCUTOU {vezes: 15}]->(m1),
       (u1)-[:CURTIU]->(m1),
       (u1)-[:SEGUE]->(a1),
       (u1)-[:ESCUTOU {vezes: 5}]->(m3),
       
       (u2)-[:ESCUTOU {vezes: 40}]->(m2),
       (u2)-[:CURTIU]->(m2),
       (u2)-[:SEGUE]->(a2),
       
       (u3)-[:ESCUTOU {vezes: 100}]->(m3),
       (u3)-[:CURTIU]->(m3),
       (u3)-[:SEGUE]->(a3),
       
       (u4)-[:ESCUTOU {vezes: 25}]->(m4),
       (u4)-[:CURTIU]->(m4),
       (u4)-[:SEGUE]->(a4),
       (u4)-[:ESCUTOU {vezes: 12}]->(m1),
       
       (u5)-[:ESCUTOU {vezes: 60}]->(m5),
       (u5)-[:CURTIU]->(m5),
       (u5)-[:SEGUE]->(a5);
