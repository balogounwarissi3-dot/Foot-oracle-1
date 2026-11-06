package com.footoracle.model

enum class MatchStatus { PRE_MATCH, LIVE, FINISHED }

enum class TeamProfile {
    REGULAR, SLIGHTLY_REGULAR, IRREGULAR_TYPE_1, IRREGULAR_TYPE_2, STRICTLY_IRREGULAR, INDETERMINATE
}

enum class FavoriteCategory {
    REGULAR, SLIGHTLY_REGULAR, IRREGULAR_TYPE_1, IRREGULAR_TYPE_2, NONE
}

data class MatchHistoryItem(val scored: Int, val conceded: Int)
data class H2HItem(val home: String, val away: String, val homeGoals: Int, val awayGoals: Int)
data class TeamStats(
    val attacks: Int = 0, val dangerousAttacks: Int = 0, val possession: Int = 0,
    val shotsOnTarget: Int = 0, val shotsOffTarget: Int = 0, val corners: Int = 0,
    val yellowCards: Int = 0, val redCards: Int = 0, val penalties: Int = 0, val substitutions: Int = 0
)
data class LiveStats(val home: TeamStats = TeamStats(), val away: TeamStats = TeamStats())
data class Score(val home: Int, val away: Int)
data class Match(
    val id: String, val country: String, val competition: String, val kickoff: String,
    val status: MatchStatus, val minute: Int, val home: String, val away: String,
    val score: Score, val homeHistory: List<MatchHistoryItem>, val awayHistory: List<MatchHistoryItem>,
    val liveStats: LiveStats?, val h2h: List<H2HItem>
)
data class FootOracleData(val formatVersion: Int, val source: String, val collectedAt: String, val matches: List<Match>)
data class PredictionResult(
    val matchId: String, val predictionText: String, val ruleExplanation: String,
    val homeProfile: TeamProfile, val awayProfile: TeamProfile, val favoriteCategory: FavoriteCategory,
    val isIgnored: Boolean = false, val hasError: Boolean = false, val errorMessage: String? = null
)
