# 🎵 Music Graph Analytics: Recomendação Inteligente com Neo4j

![Neo4j](https://img.shields.io/badge/Neo4j-008CC1?style=for-the-badge&logo=neo4j&logoColor=white)
![Cypher](https://img.shields.io/badge/Cypher-45818e?style=for-the-badge&logo=neo4j&logoColor=white)
![Status](https://img.shields.io/badge/Status-Finalizado-green?style=for-the-badge)

## 📋 Visão Geral do Desafio
Este projeto foi desenvolvido para o desafio da **DIO**, focado na criação de um sistema de recomendação de músicas utilizando Bancos de Dados de Grafos (Neo4j). O sistema identifica padrões de escuta para sugerir novas faixas e artistas com base em conexões lógicas.

### Requisitos Atendidos:
- **Nós:** Representação de Usuários, Músicas, Artistas e Gêneros.
- **Arestas:** Representação de interações (Escutar, Curtir, Seguir) com propriedades.
- **Consultas Cypher:** Geração de recomendações personalizadas.

## 🏗️ Modelagem do Grafo
A estrutura foi desenhada no **Arrows.app**, utilizando uma organização por camadas para garantir clareza visual e facilitar a análise de dados.

### Entidades (Nós):
* **Usuario (Azul):** Representa o ouvinte (`nome`, `idade`).
* **Musica (Verde):** A faixa musical (`titulo`).
* **Artista (Roxo):** O criador ou banda (`nome`).
* **Genero (Laranja):** A categoria musical (`nome`).

### Relacionamentos (Arestas):
* `(:Usuario)-[:ESCUTOU {vezes: 15}]->(:Musica)`
* `(:Usuario)-[:CURTIU]->(:Musica)`
* `(:Usuario)-[:SEGUE]->(:Artista)`
* `(:Musica)-[:INTERPRETADA_POR]->(:Artista)`
* `(:Musica)-[:PERTENCE_AO]->(:Genero)`

## 🚀 Implementação (Cypher Script)

Utilize o script abaixo para povoar o seu banco de dados Neo4j com o ecossistema completo (5 itens de cada categoria):

```cypher
// 1. Criando os Gêneros
CREATE (g1:Genero {nome: 'Rock'}), (g2:Genero {nome: 'Pop'}), (g3:Genero {nome: 'Sertanejo'}), (g4:Genero {nome: 'R&B'}), (g5:Genero {nome: 'Reggaeton'});

// 2. Criando Artistas e Músicas
CREATE (u1:Usuario {nome: 'João', idade: 25}), (u2:Usuario {nome: 'Maria', idade: 30}), (u3:Usuario {nome: 'Carlos', idade: 22}), (u4:Usuario {nome: 'Ana', idade: 28}), (u5:Usuario {nome: 'Pedro', idade: 35}),
       (m1:Musica {titulo: 'Bohemian Rhapsody'}), (a1:Artista {nome: 'Queen'}),
       (m2:Musica {titulo: 'Envolver'}), (a2:Artista {nome: 'Anitta'}),
       (m3:Musica {titulo: 'Infiel'}), (a3:Artista {nome: 'Marília Mendonça'}),
       (m4:Musica {titulo: 'Blinding Lights'}), (a4:Artista {nome: 'The Weeknd'}),
       (m5:Musica {titulo: 'Stay'}), (a5:Artista {nome: 'Justin Bieber'});

// 3. Criando as Conexões e Propriedades
CREATE (u1)-[:ESCUTOU {vezes: 15}]->(m1), (m1)-[:INTERPRETADA_POR]->(a1), (m1)-[:PERTENCE_AO]->(g1),
       (u2)-[:ESCUTOU {vezes: 40}]->(m2), (m2)-[:INTERPRETADA_POR]->(a2), (m2)-[:PERTENCE_AO]->(g5),
       (u3)-[:ESCUTOU {vezes: 100}]->(m3), (m3)-[:INTERPRETADA_POR]->(a3), (m3)-[:PERTENCE_AO]->(g3),
       (u4)-[:ESCUTOU {vezes: 25}]->(m4), (m4)-[:INTERPRETADA_POR]->(a4), (m4)-[:PERTENCE_AO]->(g2),
       (u5)-[:ESCUTOU {vezes: 60}]->(m5), (m5)-[:INTERPRETADA_POR]->(a5), (m5)-[:PERTENCE_AO]->(g2),
       (u1)-[:CURTIU]->(m3), (u1)-[:SEGUE]->(a1), (u2)-[:CURTIU]->(m4), (u3)-[:SEGUE]->(a3);
