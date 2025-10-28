import { useState } from 'react'
import './App.css'

function App() {
  const [currentView, setCurrentView] = useState('home')
  
  return (
    <div className="app-container">
      <header className="app-header">
        <h1>Méjekoné</h1>
        <nav className="main-nav">
          <button onClick={() => setCurrentView('home')}>Accueil</button>
          <button onClick={() => setCurrentView('playlists')}>Playlists</button>
          <button onClick={() => setCurrentView('games')}>Parties</button>
          <button onClick={() => setCurrentView('login')}>Connexion</button>
        </nav>
      </header>
      
      <main className="app-content">
        {currentView === 'home' && (
          <div className="home-view">
            <h2>Bienvenue sur Méjekoné</h2>
            <p>L'application de blindtest pour tester vos connaissances musicales !</p>
            <div className="action-buttons">
              <button className="primary-button" onClick={() => setCurrentView('games')}>
                Rejoindre une partie
              </button>
              <button className="secondary-button" onClick={() => setCurrentView('playlists')}>
                Créer une playlist
              </button>
            </div>
          </div>
        )}
        
        {currentView === 'playlists' && (
          <div className="playlists-view">
            <h2>Mes Playlists</h2>
            <p>Vous n'avez pas encore de playlists. Créez-en une !</p>
            <button className="primary-button">Nouvelle Playlist</button>
          </div>
        )}
        
        {currentView === 'games' && (
          <div className="games-view">
            <h2>Parties en cours</h2>
            <p>Aucune partie en cours. Créez-en une !</p>
            <button className="primary-button">Nouvelle Partie</button>
          </div>
        )}
        
        {currentView === 'login' && (
          <div className="login-view">
            <h2>Connexion</h2>
            <form className="login-form">
              <div className="form-group">
                <label htmlFor="username">Nom d'utilisateur</label>
                <input type="text" id="username" name="username" />
              </div>
              <div className="form-group">
                <label htmlFor="password">Mot de passe</label>
                <input type="password" id="password" name="password" />
              </div>
              <button type="submit" className="primary-button">Se connecter</button>
            </form>
            <p>
              Pas encore de compte ? <button className="text-button">S'inscrire</button>
            </p>
          </div>
        )}
      </main>
      
      <footer className="app-footer">
        <p>&copy; 2023 Méjekoné - Application de Blindtest</p>
      </footer>
    </div>
  )
}

export default App
