namespace hellmath {
    enum class AccountStatus {
        troll,
        guest,
        user,
        mod
    };

    enum class Action {
        read,
        write,
        remove
    };

    bool display_post(AccountStatus poster, AccountStatus viewer) {
        if (poster == AccountStatus::troll && viewer != AccountStatus::troll)
            return false;
        return true;
    }

    bool permission_check(Action action, AccountStatus status) {
        bool permission{false};
        switch(status) {
            case AccountStatus::guest:
                permission = (action == Action::read);
                break;
            case AccountStatus::troll:
                permission = (action == Action::read || action == Action::write);
                [[fallthrough]];
            case AccountStatus::user:
                permission = (action == Action::read || action == Action::write);
                break;
            default:
                permission = (action == Action::read || action == Action::write || action == Action::remove);
                break;
        }
        return permission; 
    }

    bool valid_player_combination(AccountStatus first, AccountStatus second) {
        if (first == AccountStatus::guest || second == AccountStatus::guest) 
            return false;
        if((first == AccountStatus::troll && second != AccountStatus::troll) ||
            (second == AccountStatus::troll && first != AccountStatus::troll)) 
            return false;
        return true; 
    }

    bool has_priority(AccountStatus first, AccountStatus second) {
        return first > second; 
    }
}  // namespace hellmath