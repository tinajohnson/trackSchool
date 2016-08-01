class Dropdown_filter extends React.Component {

    constructor(props) {
        super(props);

        this.state = {
            data : 0,
            flag : false,
            bool : "No clicks yet.",
            val  : "Enter roll_no"
        }

        this.setNewNumber = this.setNewNumber.bind(this)
    };

    setNewNumber(event) {
        this.setState({val : event.target.value})

    }

    render() {
        return (

            <div>
                <select className="browser-default waves-effect waves-light btn" name={this.props.name}>
                    <option value={this.props.option1} >{this.props.option1}</option>
                    <option value={this.props.option2} >{this.props.option2}</option>
                </select>
            </div>
        );
    }
}